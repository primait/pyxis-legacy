module Pyxis.Update exposing (update)

import Pyxis.Model as PyxisModel
import Pyxis.Page.Button as Button
import Pyxis.Page.Colors as Colors
import Pyxis.Page.Typography as Typography
import Pyxis.Sidebar as Sidebar
import Pyxis.UpdateHelpers as UH


update : PyxisModel.Msg -> PyxisModel.Model -> ( PyxisModel.Model, Cmd PyxisModel.Msg )
update msg model =
    case msg of
        PyxisModel.OnRouteChange route ->
            model
                |> PyxisModel.updateRoute route
                |> UH.withCmds
                    [ UH.replaceUrl model.routeKey route
                    ]

        PyxisModel.SidebarMsg sidebarMsg ->
            dispatchSidebarMsg sidebarMsg model

        PyxisModel.ButtonMsg buttonMsg ->
            dispatchButtonMsg buttonMsg model

        PyxisModel.ColorsMsg colorsMsg ->
            dispatchColorsMsg colorsMsg model

        PyxisModel.TypographyMsg typographyMsg ->
            dispatchTypographyMsg typographyMsg model

        _ ->
            ( model, Cmd.none )


dispatchSidebarMsg : Sidebar.Msg -> PyxisModel.Model -> ( PyxisModel.Model, Cmd PyxisModel.Msg )
dispatchSidebarMsg subMsg model =
    let
        ( sidebarModel, sidebarCmd, maybeRoute ) =
            Sidebar.update subMsg model.sidebar
    in
    model
        |> PyxisModel.updateSidebar sidebarModel
        |> UH.withCmds
            [ Cmd.map PyxisModel.SidebarMsg sidebarCmd
            , maybeRoute
                |> Maybe.map (UH.sendCmd << PyxisModel.OnRouteChange)
                |> Maybe.withDefault Cmd.none
            ]


dispatchButtonMsg : Button.Msg -> PyxisModel.Model -> ( PyxisModel.Model, Cmd PyxisModel.Msg )
dispatchButtonMsg subMsg model =
    let
        ( buttonModel, buttonCmd ) =
            Button.update subMsg model.buttonModel
    in
    model
        |> PyxisModel.updateButton buttonModel
        |> UH.withCmds
            [ Cmd.map PyxisModel.ButtonMsg buttonCmd
            ]


dispatchColorsMsg : Colors.Msg -> PyxisModel.Model -> ( PyxisModel.Model, Cmd PyxisModel.Msg )
dispatchColorsMsg subMsg model =
    let
        ( colorsModel, colorsCmd ) =
            Colors.update subMsg model.colorsModel
    in
    model
        |> PyxisModel.updateColors colorsModel
        |> UH.withCmds
            [ Cmd.map PyxisModel.ColorsMsg colorsCmd
            ]


dispatchTypographyMsg : Typography.Msg -> PyxisModel.Model -> ( PyxisModel.Model, Cmd PyxisModel.Msg )
dispatchTypographyMsg subMsg model =
    let
        typographyCmd =
            Typography.update subMsg
    in
    model |> UH.withCmds [ Cmd.map PyxisModel.TypographyMsg typographyCmd ]

module Pyxis.Update exposing (update)

import Pyxis.Model as PyxisModel
import Pyxis.Model.Style.Colors as Colors
import Pyxis.Sidebar as Sidebar
import Pyxis.Update.Helpers as UH
import Pyxis.Update.Style.Colors as ColorsUpdate
import Pyxis.View.Pages.Style.Typography as Typography


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


dispatchColorsMsg : Colors.Msg -> PyxisModel.Model -> ( PyxisModel.Model, Cmd PyxisModel.Msg )
dispatchColorsMsg subMsg model =
    let
        ( colorsModel, colorsCmd ) =
            ColorsUpdate.update subMsg model.colorsModel
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

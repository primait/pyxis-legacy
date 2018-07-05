module Pyxis.Update exposing (update)

import Pyxis.Components.Colors.Model as ColorsModel
import Pyxis.Components.Colors.Update as ColorsUpdate
import Pyxis.Components.Form.Model as FormModel
import Pyxis.Components.Form.Update as FormUpdate
import Pyxis.Helpers
    exposing
        ( changeRoute
        , updateMenu
        , withCmds
        , withoutCmds
        )
import Pyxis.Model
    exposing
        ( Menu
        , Model
        , Msg(..)
        , Route(..)
        )
import Pyxis.Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "update" msg of
        LocationChange location ->
            { model
                | route = parseLocation location
                , menu = updateMenu (parseLocation location) model.menu
            }
                |> withoutCmds

        RouteUpdate route ->
            { model
                | route = route
                , menu = updateMenu route model.menu
            }
                |> withCmds [ changeRoute route ]

        ShowSource source ->
            { model | htmlSnippet = Just source } |> withoutCmds

        HideSource ->
            { model | htmlSnippet = Nothing } |> withoutCmds

        ColorsMsg colorsMsg ->
            updateColors model colorsMsg model.colors

        FormMsg formMsg ->
            updateForm model formMsg model.form


updateForm : Model -> FormModel.Msg -> FormModel.Model -> ( Model, Cmd Msg )
updateForm model msg formModel =
    let
        ( newFormModel, cmds ) =
            FormUpdate.update msg formModel
    in
    { model | form = newFormModel } ! [ Cmd.map FormMsg cmds ]


updateColors : Model -> ColorsModel.Msg -> ColorsModel.Model -> ( Model, Cmd Msg )
updateColors model msg colorsModel =
    let
        ( newColorsModel, cmds ) =
            ColorsUpdate.update msg colorsModel
    in
    { model | colors = newColorsModel } ! [ Cmd.map ColorsMsg cmds ]

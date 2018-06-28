module Pyxis.Update exposing (update)

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

        FormMsg formMsg ->
            updateForm model formMsg model.form


updateForm : Model -> FormModel.Msg -> FormModel.Model -> ( Model, Cmd Msg )
updateForm model msg formModel =
    let
        ( newFormModel, cmds ) =
            FormUpdate.update msg formModel
    in
    { model | form = newFormModel } ! [ Cmd.map FormMsg cmds ]

module Pyxis.Update exposing (update)

import Pyxis.Components.Form.Model as FormModel
import Pyxis.Components.Form.Update as FormUpdate
import Pyxis.Helpers
    exposing
        ( changeRoute
        , withCmds
        , withoutCmds
        )
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "update" msg of
        LocationChange location ->
            { model | route = parseLocation location } |> withoutCmds

        RouteUpdate route ->
            { model | route = route } |> withCmds [ changeRoute route ]

        FormMsg formMsg ->
            updateForm model formMsg model.form


updateForm : Model -> FormModel.Msg -> FormModel.Model -> ( Model, Cmd Msg )
updateForm model msg formModel =
    let
        ( newFormModel, cmds ) =
            FormUpdate.update msg formModel
    in
    { model | form = newFormModel } ! [ Cmd.map FormMsg cmds ]

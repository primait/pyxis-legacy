module Pyxis.Components.Login.Update exposing (update)

import Pyxis.Components.Login.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        )
import Pyxis.Helpers
    exposing
        ( withCmds
        , withoutCmds
        )
import Pyxis.Ports as Ports


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FormNoOp ->
            model |> withoutCmds

        UpdateText Email value ->
            { model
                | emailField = value
            }
                |> withoutCmds

        UpdateText Password value ->
            { model
                | passwordField = value
            }
                |> withoutCmds

        Focus _ ->
            model |> withoutCmds

        Blur _ ->
            model |> withoutCmds

        InspectHtml selector ->
            model |> withCmds [ Ports.inspectHtml selector ]

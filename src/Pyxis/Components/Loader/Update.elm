module Pyxis.Components.Loader.Update exposing (update)

import Pyxis.Components.Loader.Model
    exposing
        ( Model
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
        FetchTemplate (Ok template) ->
            { model | template = Just template } |> withoutCmds

        FetchTemplate (Err err) ->
            withoutCmds model

        InspectHtml selector ->
            model |> withCmds [ Ports.inspectHtml selector ]

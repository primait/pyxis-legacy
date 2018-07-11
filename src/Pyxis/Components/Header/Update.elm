module Pyxis.Components.Header.Update exposing (update)

import Pyxis.Components.Header.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.Helpers
    exposing
        ( withCmds
        , withoutCmds
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchTemplate (Ok template) ->
            { model | template = Just template } |> withoutCmds

        FetchTemplate (Err err) ->
            withoutCmds model

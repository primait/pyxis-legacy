module Pyxis.Helpers exposing (..)

import Pyxis.Model exposing (Model, Msg)


withCmds : List (Cmd Msg) -> Model -> ( Model, Cmd Msg )
withCmds cmds model =
    ( model, Cmd.batch cmds )


withoutCmds : Model -> ( Model, Cmd Msg )
withoutCmds =
    withCmds []

module Pyxis.Components.Jumbotron.Update exposing (update)

import Pyxis.Components.Jumbotron.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.Helpers
    exposing
        ( withoutCmds
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model |> withoutCmds




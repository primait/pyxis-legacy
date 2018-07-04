module Pyxis.Components.Colors.Update exposing (update)

import Pyxis.Components.Colors.Model
    exposing
        ( Color
        , ColorTone(..)
        , Model
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
        PickTone color tone ->
            model |> withoutCmds

module Pyxis.Pages.NotFound exposing (..)

import Html exposing (Html, div, text)
import Pyxis.Model exposing (Msg)


view : Html Msg
view =
    div
        []
        [ text "404" ]

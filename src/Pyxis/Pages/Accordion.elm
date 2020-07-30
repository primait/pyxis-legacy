module Pyxis.Pages.Accordion exposing (view)

import Html exposing (Html, div, text)
import Pyxis.Model exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div
        []
        [ text "This is accordion" ]

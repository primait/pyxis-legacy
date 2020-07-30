module Pyxis.Commons.Menu exposing (view)

import Html exposing (Html, div, nav, text)
import Html.Attributes exposing (class)
import Pyxis.Model exposing (Model, Msg)


view : Model -> Html Msg
view model =
    nav
        [ class "pyxis__menu" ]
        [ text "This is menu"
        ]

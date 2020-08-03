module Pages.NotFound exposing (view)

import Html exposing (Html, div, text)
import Model exposing (Msg)


view : Html Msg
view =
    div
        []
        [ text "404" ]

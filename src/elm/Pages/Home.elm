module Pages.Home exposing (view)

import Html exposing (Html, div, h1, text)
import Model exposing (Model, Msg)


view : Model -> Html Msg
view ({ t } as model) =
    div
        []
        [ h1 [] [ text "This is homepage" ]
        , text <| t "hello" [ ( "name", "World" ) ]
        ]

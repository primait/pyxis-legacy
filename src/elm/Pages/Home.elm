module Pages.Home exposing (view)

import Html exposing (Html, div, h1, p, section, text)
import Html.Attributes exposing (class)
import Model exposing (Model, Msg)


view : Model -> Html Msg
view ({ t } as model) =
    div
        [ class "home-page" ]
        [ section
            [ class "section" ]
            [ div [ class "box" ]
                [ h1 [] [ text "Pyxis" ]
                , p [] [ text <| t "home.pyxis-description" [] ]
                ]
            ]
        ]

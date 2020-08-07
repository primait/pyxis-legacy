module Pages.Home exposing (view)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)
import Model exposing (Model, Msg)


view : Model -> Html Msg
view ({ t } as model) =
    div
        [ class "home-page" ]
        [ h1 [] [ text "Home" ] ]

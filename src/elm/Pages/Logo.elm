module Pages.Logo exposing (view)

import Html exposing (Html, div, h1)
import Html.Attributes exposing (class)
import Model exposing (Model, Msg)


view : Model -> Html Msg
view { translate } =
    div [ class "logo-page" ]
        [ h1 []
            [ Html.text <| translate [] "logo-page.title" ]
        , Html.p []
            [ Html.text <| translate [] "common.page-under-construction" ]
        ]

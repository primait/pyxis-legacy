module Pages.Illustration exposing (view)

import Html exposing (Html, div, h1)
import Html.Attributes exposing (class)
import Model exposing (Model, Msg)


view : Model -> Html Msg
view { translate } =
    div [ class "illustration-page" ]
        [ h1 []
            [ Html.text <| translate [] "illustration-page.title" ]
        , Html.p []
            [ Html.text <| translate [] "common.page-under-construction" ]
        ]

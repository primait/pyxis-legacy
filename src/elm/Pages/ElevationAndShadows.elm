module Pages.ElevationAndShadows exposing (view)

import Html exposing (Html, div, h1)
import Html.Attributes exposing (class)
import Model exposing (Model, Msg)


view : Model -> Html Msg
view { translate } =
    div [ class "elevation-and-shadows-page" ]
        [ h1 []
            [ Html.text <| translate [] "elevation-and-shadows-page.title" ]
        , Html.p []
            [ Html.text <| translate [] "common.page-under-construction" ]
        ]

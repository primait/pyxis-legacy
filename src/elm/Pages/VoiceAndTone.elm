module Pages.VoiceAndTone exposing (view)

import Html exposing (Html, div, h1)
import Html.Attributes exposing (class)
import Model exposing (Model, Msg)


view : Model -> Html Msg
view { translate } =
    div [ class "voice-and-tone-page" ]
        [ h1 []
            [ Html.text <| translate [] "voice-and-tone-page.title" ]
        , Html.p []
            [ Html.text <| translate [] "common.page-under-construction" ]
        ]

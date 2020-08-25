module Commons.CodeViewer exposing (view)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias ViewConfig msg =
    { code : String
    , copyButtonText : String
    , onCopyCode : String -> msg
    }


view : ViewConfig msg -> Html msg
view { code, copyButtonText, onCopyCode } =
    div [ class "code-viewer" ]
        [ div
            [ class "code-viewer__header" ]
            [ button
                [ class "code-viewer__button"
                , onClick (onCopyCode code)
                ]
                [ text copyButtonText ]
            ]
        , Html.code
            [ class "code-viewer__content" ]
            [ text code ]
        ]

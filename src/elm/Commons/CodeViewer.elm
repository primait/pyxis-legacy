module Commons.CodeViewer exposing (view)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias ViewConfig =
    { code : String
    , copyButtonText : String
    , onCopyCode : String -> ()
    }


view : ViewConfig -> Html msg
view { code, copyButtonText } =
    div [ class "code-viewer" ]
        [ div
            [ class "code-viewer__header" ]
            [ button
                [ class "code-viewer__button"

                -- , onClick (onCopyCode code)
                ]
                [ text copyButtonText ]
            ]
        , Html.code
            [ class "code-viewer__content" ]
            [ text code ]
        ]

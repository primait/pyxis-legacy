module Components.ComponentViewer exposing (view)

import Array
import Commons.Box as Box
import Commons.CodeViewer as CodeViewer
import Commons.Tabs as Tabs
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, style)
import Html.Lazy exposing (lazy)


type alias ViewConfig msg =
    { isCodeVisible : Bool
    , boxType : Box.Type
    , label : String
    , example : String
    , onTogglePreview : Bool -> msg
    }


view : ViewConfig msg -> List (Html msg) -> Html msg
view { isCodeVisible, label, boxType, example, onTogglePreview } content =
    let
        activeTab =
            stateToTabIndex isCodeVisible
    in
    Tabs.view
        { active = activeTab
        , tabs =
            Array.fromList
                [ { name = "Preview"
                  , view = lazy (\_ -> viewComponentBox boxType label content) ()
                  }
                , { name = "</> Code"
                  , view = lazy viewCodeViewer example
                  }
                ]
        , onTabClick = \int -> onTogglePreview (tabIndexToState int)
        }



-- HELPERS


stateToTabIndex : Bool -> Int
stateToTabIndex isCodeVisible =
    if isCodeVisible then
        1

    else
        0


tabIndexToState : Int -> Bool
tabIndexToState index =
    index == 1



-- VIEW HELPERS


viewComponentBox : Box.Type -> String -> List (Html msg) -> Html msg
viewComponentBox boxType componentLabel content =
    Box.view boxType
        [ div [ class "component-viewer" ]
            [ div [ class "component-viewer__description" ]
                [ div [ class "fw-heavy" ] [ text "COMPONENT" ]
                , div [] [ text componentLabel ]
                ]
            , div
                [ class "component-viewer__container"
                ]
                content
            ]
        ]


viewCodeViewer : String -> Html msg
viewCodeViewer code =
    CodeViewer.view
        { code = code
        , copyButtonText = "Copia Codice"
        , onCopyCode = always ()
        }

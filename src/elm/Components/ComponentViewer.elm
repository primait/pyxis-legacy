module Components.ComponentViewer exposing (view)

import Array exposing (Array)
import Commons.Box as Box
import Commons.CodeViewer as CodeViewer
import Commons.Tabs as Tabs
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, style)
import Html.Lazy exposing (lazy)
import Prima.Pyxis.Accordion exposing (state)


type alias ViewModel msg =
    { isCodeVisible : Bool
    , boxType : Box.Type
    , example : String
    , onTogglePreview : Bool -> msg
    }


view : ViewModel msg -> List (Html msg) -> Html msg
view { isCodeVisible, boxType, example, onTogglePreview } content =
    let
        activeTab =
            stateToTabIndex isCodeVisible
    in
    Tabs.view
        { active = activeTab
        , tabs =
            Array.fromList
                [ { name = "Preview"
                  , view = lazy (\_ -> viewComponentBox boxType content) ()
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


viewComponentBox : Box.Type -> List (Html msg) -> Html msg
viewComponentBox boxType content =
    let
        typeLabel =
            case boxType of
                Box.Light ->
                    "light color"

                Box.Dark ->
                    "dark color"

                Box.Gradient ->
                    "brand gradient"
    in
    Box.view boxType
        [ div [ class "display-flex" ]
            [ div [ style "flex-grow" "0" ]
                [ div [ class "fw-heavy" ] [ text "COMPONENT" ]
                , div [] [ text <| "on " ++ typeLabel ]
                ]
            , div
                [ class "u-pos-center"
                , style "flex-grow" "1"
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

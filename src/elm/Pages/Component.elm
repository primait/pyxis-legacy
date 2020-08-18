module Pages.Component exposing (SectionViewConfig, Suggestions, ViewConfig, view)

import Helpers as H
import Html exposing (Html, div, h1, h2, h5, li, p, section, text, ul)
import Html.Attributes exposing (class, classList, style)
import ViewHelpers as VH


type alias ViewConfig msg =
    { title : String
    , description : String
    , specsList : List String
    , viewComponent : () -> Html msg
    , sections : List (SectionViewConfig msg)
    }


type alias SectionViewConfig msg =
    { title : String
    , suggestions : Maybe Suggestions
    , content : List (Html msg)
    }


type alias Suggestions =
    { dontList : List String
    , doList : List String
    }


view : ViewConfig msg -> Html msg
view config =
    div
        [ class "component-page" ]
        [ section [ class "section" ]
            [ h1
                [ class "c-text-dark" ]
                [ text config.title ]
            , p []
                [ text config.description ]
            ]
        , viewTechSpecs
            config.specsList
            (config.viewComponent ())
        , div []
            (List.map
                (\sectionConfig ->
                    viewSection
                        { title = sectionConfig.title
                        , suggestions = sectionConfig.suggestions
                        }
                        sectionConfig.content
                )
                config.sections
            )
        ]


viewTechSpecs : List String -> Html msg -> Html msg
viewTechSpecs specs component =
    section [ class "section flex-container" ]
        [ div [ class "u-pos-center" ]
            [ div
                [ class "preview-box"
                ]
                [ component ]
            ]
        , div []
            [ h5 [ class "c-text-dark" ]
                [ text "SPECIFICHE TECNICHE" ]
            , ul [] <|
                List.map
                    (\item -> li [] [ text item ])
                    specs
            ]
        ]


type alias ViewSectionConfig =
    { title : String
    , suggestions : Maybe Suggestions
    }


viewSection : ViewSectionConfig -> List (Html msg) -> Html msg
viewSection config content =
    let
        hasSuggestions =
            H.isJust config.suggestions

        doList =
            Maybe.map .doList config.suggestions
                |> Maybe.withDefault []

        dontList =
            Maybe.map .dontList config.suggestions
                |> Maybe.withDefault []
    in
    section [ class "section" ]
        [ h2 [] [ text config.title ]
        , div
            []
            content
        , VH.viewIf hasSuggestions
            (div
                [ class "flex-container" ]
                [ viewSuggestions
                    { label = "Don't"
                    , isRecommendation = False
                    , items = dontList
                    }
                , viewSuggestions
                    { label = "Do"
                    , isRecommendation = True
                    , items = doList
                    }
                ]
            )
        ]


type alias ViewSuggestionsListConfig =
    { label : String
    , isRecommendation : Bool
    , items : List String
    }


viewSuggestions : ViewSuggestionsListConfig -> Html msg
viewSuggestions { label, isRecommendation, items } =
    div
        [ class "suggestions-list"
        , classList
            [ ( "suggestions-list--do", isRecommendation )
            , ( "suggestions-list--dont", not isRecommendation )
            ]
        ]
        [ div [ class "suggestions-list__header" ]
            [ div [ class "suggestions-list__label" ]
                [ text label ]
            , div [ class "suggestions-list__separator" ] []
            ]
        , ul [] <|
            List.map
                (\item ->
                    li [ class "suggestions-list__item" ]
                        [ text item ]
                )
                items
        ]

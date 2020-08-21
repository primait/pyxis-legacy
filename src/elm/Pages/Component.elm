module Pages.Component exposing
    ( SectionViewConfig
    , Suggestions
    , ViewConfig
    , WithCodeInspectors
    , isInspecting
    , toggleInspect
    , view
    )

import Dict exposing (Dict)
import Helpers as H
import Html exposing (Html, div, h1, h2, h5, li, p, section, text, ul)
import Html.Attributes exposing (class, classList)
import ViewHelpers as VH


type alias WithCodeInspectors a =
    { a
        | inspectMode : Dict String Bool
    }


toggleInspect : String -> Bool -> WithCodeInspectors a -> WithCodeInspectors a
toggleInspect id isActive model =
    { model | inspectMode = Dict.insert id isActive model.inspectMode }


isInspecting : String -> WithCodeInspectors a -> Bool
isInspecting id { inspectMode } =
    Dict.get id inspectMode
        |> Maybe.withDefault False



-- VIEW


type alias ViewConfig msg =
    { title : String
    , description : String
    , specs :
        Maybe
            { list : List String
            , viewComponent : Html msg
            }
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
        , case config.specs of
            Nothing ->
                text ""

            Just specs ->
                viewTechSpecs specs.list specs.viewComponent
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
        , div [ class "specs-list" ]
            [ h5 [ class "specs-list__header" ]
                [ text "SPECIFICHE TECNICHE" ]
            , ul [ class "specs-list__list" ] <|
                List.map
                    (\item -> li [ class "specs-list__item" ] [ text item ])
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
                [ viewSuggestionsList
                    { label = "Don't"
                    , isRecommendation = False
                    , items = dontList
                    }
                , viewSuggestionsList
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


viewSuggestionsList : ViewSuggestionsListConfig -> Html msg
viewSuggestionsList { label, isRecommendation, items } =
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

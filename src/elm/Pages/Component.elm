module Pages.Component exposing (SectionViewModel, ViewModel, view)

import Html exposing (Html, div, h1, h2, h5, li, p, section, text, ul)
import Html.Attributes exposing (class, classList, style)


type alias ViewModel msg =
    { title : String
    , description : String
    , specsList : List String
    , viewComponent : () -> Html msg
    , sections : List (SectionViewModel msg)
    }


type alias SectionViewModel msg =
    { title : String
    , dontList : List String
    , doList : List String
    , content : List (Html msg)
    }


view : ViewModel msg -> Html msg
view model =
    div
        [ class "component-page" ]
        [ section []
            [ h1
                [ class "c-text-dark" ]
                [ text model.title ]
            , p []
                [ text model.description ]
            ]
        , viewTechSpecs
            model.specsList
            (model.viewComponent ())
        , div []
            (List.map
                (\config ->
                    viewSection
                        { title = config.title
                        , dontList = config.dontList
                        , doList = config.doList
                        }
                        config.content
                )
                model.sections
            )
        ]


viewTechSpecs : List String -> Html msg -> Html msg
viewTechSpecs specs component =
    section [ class "flex-container" ]
        [ div [ class "u-pos-center" ]
            [ div
                [ class "box u-pos-center", style "width" "100%" ]
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
    , dontList : List String
    , doList : List String
    }


viewSection : ViewSectionConfig -> List (Html msg) -> Html msg
viewSection config content =
    section []
        [ h2 [] [ text config.title ]
        , div
            []
            content
        , div
            [ class "flex-container" ]
            [ viewSuggestions
                { label = "Don't"
                , isRecommendation = False
                , items = config.dontList
                }
            , viewSuggestions
                { label = "Do"
                , isRecommendation = True
                , items = config.doList
                }
            ]
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
        , ul [] <| List.map (\item -> li [] [ text item ]) items
        ]

module Pages.Button exposing (view)

import Commons.Box as Box exposing (Type)
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div, h1, h2, h5, li, p, section, text, ul)
import Html.Attributes exposing (class, classList, style)
import Html.Lazy exposing (lazy)
import Pages.Button.Model exposing (Model, Msg(..))


view : Model -> Html Msg
view ({ t } as model) =
    let
        viewModel =
            { title = "Component"
            , description = """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                nisi ut aliquip ex ea commodo consequat."""
            , specs = [ "Spec 1", "Spec 2", "Spec 3" ]
            , viewComponent = \_ -> div [] [ text "[Rendered Component]" ]
            }
    in
    div
        [ class "button-page" ]
        [ section []
            [ h1
                [ class "c-text-dark" ]
                [ text viewModel.title ]
            , p []
                [ text viewModel.description ]
            ]
        , viewTechSpecs
            viewModel.specs
            (viewModel.viewComponent ())
        , viewSection
            { title = "Component Variation 1"
            , dontList = [ "no, this is wrong", "dont use it" ]
            , doList = [ "do this", "yes, it's correct" ]
            }
            [ ComponentViewer.view
                { isCodeVisible = model.isInspecting
                , boxType = Box.Light
                , example = """<div class="c-component-name is-light" />"""
                , onTogglePreview = ToggleInspectMode
                }
                [ viewModel.viewComponent () ]
            , ComponentViewer.view
                { isCodeVisible = model.isInspecting
                , boxType = Box.Dark
                , example = """<div class="c-component-name is-dark" />"""
                , onTogglePreview = ToggleInspectMode
                }
                []
            , ComponentViewer.view
                { isCodeVisible = model.isInspecting
                , boxType = Box.Gradient
                , example = """<div class="c-component-name is-gradient" />"""
                , onTogglePreview = ToggleInspectMode
                }
                []
            ]
        ]


viewTechSpecs : List String -> Html Msg -> Html Msg
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


type alias SectionConfig =
    { title : String
    , dontList : List String
    , doList : List String
    }


viewSection : SectionConfig -> List (Html Msg) -> Html Msg
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
                , isRecommended = False
                , items = config.dontList
                }
            , viewSuggestions
                { label = "Do"
                , isRecommended = True
                , items = config.doList
                }
            ]
        ]


type alias SuggestionsConfig =
    { label : String
    , isRecommended : Bool
    , items : List String
    }


viewSuggestions : SuggestionsConfig -> Html Msg
viewSuggestions { label, isRecommended, items } =
    div
        [ class "suggestions-list"
        , classList
            [ ( "suggestions-list--do", isRecommended )
            , ( "suggestions-list--dont", not isRecommended )
            ]
        ]
        [ div [ class "suggestions-list__header" ]
            [ div [ class "suggestions-list__label" ]
                [ text label ]
            , div [ class "suggestions-list__separator" ] []
            ]
        , ul [] <| List.map (\item -> li [] [ text item ]) items
        ]

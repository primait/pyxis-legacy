module Pyxis.Components.Form.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Prima.Form as Form
import Pyxis.Components.Form.Config exposing (..)
import Pyxis.Components.Form.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        , inspectableHtml
        , renderIf
        , renderOrNothing
        , renderUnless
        )


view : Model -> List (Html Msg)
view ({ datepicker, showSeparated } as model) =
    let
        isDisabled =
            model.formDisabled

        render config =
            Form.render model config

        dateFieldConfig datepicker =
            Maybe.map (render << datepickerFieldConfig isDisabled) datepicker
    in
    [ componentTitle [ text "Form components", toggleSeparation showSeparated ]
    , divider
    ]
        ++ (if showSeparated then
                [ (componentShowdown "Input text" "inputText" InspectHtml << List.singleton << render)
                    (textFieldConfig isDisabled)
                , (componentShowdown "Textarea" "textarea" InspectHtml << List.singleton << render)
                    (textareaFieldConfig isDisabled)
                , (componentShowdown "Datepicker" "datepicker" InspectHtml << List.singleton << renderOrNothing)
                    (dateFieldConfig datepicker)
                , (componentShowdown "Autocomplete" "autocomplete" InspectHtml << List.singleton << render)
                    (autocompleteFieldConfig model)
                , (componentShowdown "Input radio" "inputRadio" InspectHtml << List.singleton << render)
                    (radioFieldConfig isDisabled)
                , (componentShowdown "Select" "select" InspectHtml << List.singleton << render)
                    (selectFieldConfig model)
                , (componentShowdown "Input checkbox" "inputCheckbox" InspectHtml << List.singleton << render)
                    (checkboxFieldConfig isDisabled)
                , (componentShowdown "Input checkbox (multi-option)" "inputCheckboxMulti" InspectHtml << List.singleton << render)
                    (checkboxWithOptionsFieldConfig model)
                ]
            else
                [ render <| textFieldConfig isDisabled
                , render <| textareaFieldConfig isDisabled
                , renderOrNothing <| dateFieldConfig datepicker
                , render <| autocompleteFieldConfig model
                , render <| radioFieldConfig isDisabled
                , render <| selectFieldConfig model
                , render <| checkboxFieldConfig isDisabled
                , render <| checkboxWithOptionsFieldConfig model
                ]
           )
        ++ [ toggleDisableForm isDisabled
           , divider
           ]


toggleSeparation : Bool -> Html Msg
toggleSeparation showSeparated =
    a
        [ class "pyLink pyFooter__link"
        , onClick ToggleSeparation
        ]
        [ (renderIf showSeparated << text) "Show all together"
        , (renderUnless showSeparated << text) "Show separated"
        ]


toggleDisableForm : Bool -> Html Msg
toggleDisableForm isDisabled =
    a
        [ class "pyLink pyFooter__link"
        , onClick ToggleDisable
        ]
        [ (renderIf isDisabled << text) "Enable form"
        , (renderUnless isDisabled << text) "Disable form"
        ]

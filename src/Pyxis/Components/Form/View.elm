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
            (Form.wrapper << Form.render model) config

        textField =
            textFieldConfig model

        textareaField =
            textareaFieldConfig model

        datepickerField =
            datePickerFieldConfig model

        autocompleteField =
            autocompleteFieldConfig model

        radioField =
            radioFieldConfig model

        selectField =
            selectFieldConfig model

        checkboxField =
            checkboxFieldConfig model

        checkboxWithOptionsField =
            checkboxWithOptionsFieldConfig model
    in
    [ componentTitle [ text "Form components", toggleSeparation showSeparated, toggleDisableForm isDisabled ]
    , divider
    ]
        ++ (if showSeparated then
                [ (componentShowdown "Input text" "inputText" InspectHtml << List.singleton << render)
                    textField
                , (componentShowdown "Textarea" "textarea" InspectHtml << List.singleton << render)
                    textareaField
                , (componentShowdown "Datepicker" "datepicker" InspectHtml << List.singleton << render)
                    datepickerField
                , (componentShowdown "Autocomplete" "autocomplete" InspectHtml << List.singleton << render)
                    autocompleteField
                , (componentShowdown "Input radio" "inputRadio" InspectHtml << List.singleton << render)
                    radioField
                , (componentShowdown "Select" "select" InspectHtml << List.singleton << render)
                    selectField
                , (componentShowdown "Input checkbox" "inputCheckbox" InspectHtml << List.singleton << render)
                    checkboxField
                , (componentShowdown "Input checkbox (multi-option)" "inputCheckboxMulti" InspectHtml << List.singleton << render)
                    checkboxWithOptionsField
                ]
            else
                [ fieldset
                    [ class "a-fieldset"
                    ]
                    [ legend
                        [ class "a-fieldset__legend" ]
                        [ text "Fieldset Legend"
                        ]
                    , render <| textField
                    , render <| textareaField
                    , render <| datepickerField
                    , render <| autocompleteField
                    , render <| radioField
                    , render <| selectField
                    , render <| checkboxField
                    , render <| checkboxWithOptionsField
                    ]
                ]
           )


toggleSeparation : Bool -> Html Msg
toggleSeparation showSeparated =
    a
        [ class "pyLink"
        , onClick ToggleSeparation
        ]
        [ (renderIf showSeparated << text) "Show all together"
        , (renderUnless showSeparated << text) "Show separated"
        ]


toggleDisableForm : Bool -> Html Msg
toggleDisableForm isDisabled =
    a
        [ class "pyLink"
        , onClick ToggleDisable
        ]
        [ (renderIf isDisabled << text) "Enable form"
        , (renderUnless isDisabled << text) "Disable form"
        ]

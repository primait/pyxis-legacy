module Pyxis.Components.Form.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Prima.Form as Form
import Pyxis.Components.Form.Config exposing (..)
import Pyxis.Components.Form.Model
    exposing
        ( Field(..)
        , Model
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
view ({ datepicker, isDatePickerOpen } as model) =
    let
        icon position name =
            div
                [ class ("m-form__field__group__" ++ position)
                ]
                [ i [ class ("a-icon a-icon-" ++ name ++ " opacity-5") ] []
                ]

        iconCalendar =
            div
                [ class "m-form__field__group__append"
                ]
                [ i [ class "a-icon a-icon-calendar c-brandAlt-dark", (onClick << Toggle Datepicker << not) isDatePickerOpen ] []
                ]

        tooltip =
            div [ class "tooltip__wrapper" ]
                [ i [ class "a-icon a-icon-info cBrandAltDark" ] []
                , div [ class "tooltip tooltip--right" ]
                    [ p []
                        [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."
                        ]
                    ]
                ]

        tooltipInfo =
            div [ class "tooltip tooltip--right tooltip--info" ]
                [ p []
                    [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."
                    ]
                ]
    in
    [ componentTitle [ text "Form components", toggleDisableForm model.formDisabled ]
    , divider
    , componentShowdown "Input"
        "input"
        InspectHtml
        [ Form.wrapper <| Form.render model <| textFieldConfig model 1
        , Form.wrapper <|
            Form.render model (textFieldSmallFirstConfig model 2)
                ++ Form.render model (textFieldSmallLastConfig model 3)
        , Form.wrapper <| Form.render model <| textFieldLargeConfig model 4
        ]
    , componentShowdown "Textarea" "textarea" InspectHtml [ Form.wrapper <| Form.render model <| textareaFieldConfig model 5 ]
    , componentShowdown "Input with icon"
        "inputicon"
        InspectHtml
        [ Form.wrapper <| Form.renderWithGroup [ icon "prepend" "mail" ] model <| textFieldIconConfig model 6
        , Form.wrapper <| Form.renderWithGroup [ icon "prepend" "lock" ] model <| passwordFieldConfig model 7
        ]
    , componentShowdown "Datepicker"
        "datepicker"
        InspectHtml
        [ Form.wrapper <| Form.renderWithGroup [ iconCalendar ] model <| datePickerFieldConfig model 8
        ]
    , componentShowdown "Input with autocomplete"
        "autocomplete"
        InspectHtml
        [ Form.wrapper <| Form.render model <| autocompleteFieldConfig model 9
        ]
    , componentShowdown "Input with tooltip"
        "inputtooltip"
        InspectHtml
        [ Form.wrapper <| Form.renderWithGroup [ tooltipInfo ] model <| textFieldTooltipConfig model 10
        , Form.wrapper <| Form.renderWithGroup [ tooltip ] model <| textFieldTooltipInfoConfig model 11
        ]
    , componentShowdown "Select" "select" InspectHtml [ Form.wrapper <| Form.render model <| selectFieldConfig model 12 ]
    , componentShowdown "Checkbox"
        "checkbox"
        InspectHtml
        [ Form.wrapper <| Form.render model <| checkboxFieldConfig model 13
        , Form.wrapper <| Form.render model <| checkboxWithOptionsFieldConfig model 14
        ]
    , componentShowdown "Radio" "radio" InspectHtml [ Form.wrapper <| Form.render model <| radioFieldConfig model 15 ]
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

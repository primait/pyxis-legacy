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
        [ Form.wrapper <| Form.render model <| textFieldConfig model
        , Form.wrapper <|
            Form.render model (textFieldSmallFirstConfig model)
                ++ Form.render model (textFieldSmallLastConfig model)
        , Form.wrapper <| Form.render model <| textFieldLargeConfig model
        ]
    , componentShowdown "Textarea" "textarea" InspectHtml [ Form.wrapper <| Form.render model <| textareaFieldConfig model ]
    , componentShowdown "Input with icon"
        "inputicon"
        InspectHtml
        [ Form.wrapper <| Form.renderWithGroup [ icon "prepend" "mail" ] model <| textFieldIconConfig model
        , Form.wrapper <| Form.renderWithGroup [ icon "prepend" "lock" ] model <| passwordFieldConfig model
        ]
    , componentShowdown "Datepicker"
        "datepicker"
        InspectHtml
        [ Form.wrapper <| Form.renderWithGroup [ iconCalendar ] model <| datePickerFieldConfig model
        ]
    , componentShowdown "Input with autocomplete"
        "autocomplete"
        InspectHtml
        [ Form.wrapper <| Form.render model <| autocompleteFieldConfig model
        ]
    , componentShowdown "Input with tooltip"
        "inputtooltip"
        InspectHtml
        [ Form.wrapper <| Form.renderWithGroup [ tooltipInfo ] model <| textFieldTooltipConfig model
        , Form.wrapper <| Form.renderWithGroup [ tooltip ] model <| textFieldTooltipInfoConfig model
        ]
    , componentShowdown "Select" "select" InspectHtml [ Form.wrapper <| Form.render model <| selectFieldConfig model ]
    , componentShowdown "Checkbox"
        "checkbox"
        InspectHtml
        [ Form.wrapper <| Form.render model <| checkboxFieldConfig model
        , Form.wrapper <| Form.render model <| checkboxWithOptionsFieldConfig model
        ]
    , componentShowdown "Radio" "radio" InspectHtml [ Form.wrapper <| Form.render model <| radioFieldConfig model ]
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

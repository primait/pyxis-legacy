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
    in
    [ componentTitle [ text "Form components", toggleDisableForm model.formDisabled ]
    , divider
    , componentShowdown "Fieldset"
        "fieldset"
        InspectHtml
        [ fieldset
            [ class "a-fieldset"
            ]
            [ legend
                [ class "a-fieldset__legend" ]
                [ text "Text input"
                ]
            , Form.wrapper <| Form.render model <| textFieldConfig model
            , Form.wrapper <| Form.render model <| textareaFieldConfig model
            , Form.wrapper <|
                Form.render model (textFieldSmallFirstConfig model)
                    ++ Form.render model (textFieldSmallLastConfig model)
            ]
        , fieldset
            [ class "a-fieldset"
            ]
            [ legend
                [ class "a-fieldset__legend" ]
                [ text "Fieldset Legend"
                ]
            , Form.wrapper <| Form.renderWithGroup [ icon "prepend" "mail" ] model <| textFieldIconConfig model
            , Form.wrapper <| Form.renderWithGroup [ icon "prepend" "lock" ] model <| passwordFieldConfig model
            , Form.wrapper <| Form.renderWithGroup [ iconCalendar ] model <| datePickerFieldConfig model
            , Form.wrapper <| Form.render model <| autocompleteFieldConfig model
            , Form.wrapper <| Form.render model <| radioFieldConfig model
            , Form.wrapper <| Form.render model <| selectFieldConfig model
            , Form.wrapper <| Form.render model <| checkboxFieldConfig model
            , Form.wrapper <| Form.render model <| checkboxWithOptionsFieldConfig model
            ]
        ]
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

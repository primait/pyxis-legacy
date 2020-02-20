module FormTooltip.FormConfig exposing
    ( address
    , dateOfBirthField
    )

import FormTooltip.Model
    exposing
        ( FieldName(..)
        , FormData
        , Model
        , Msg(..)
        )
import Html exposing (Html, p, text)
import Html.Attributes exposing (class, maxlength, minlength)
import Prima.Pyxis.Form as PyxisForm
    exposing
        ( FormField
        , FormFieldList
        , addTooltipToFieldListWhen
        , addTooltipToFieldWhen
        )
import Prima.Pyxis.Form.Event as Event
import Prima.Pyxis.Form.Validation as FormValidation
import Prima.Pyxis.Tooltip as Tooltip
import Pyxis.Helpers exposing (isJust)


dateOfBirthField : FormData -> Html Msg -> FormField FormData Msg
dateOfBirthField { isVisibleDP, dateOfBirthDP, dateOfBirth } appendable =
    PyxisForm.datepickerConfig
        "date_of_birth"
        (Just "Date of Birth")
        [ class "is-medium" ]
        .dateOfBirth
        (UpdateDatePicker DateOfBirth)
        [ Event.onInput (UpdateField DateOfBirth) ]
        dateOfBirthDP
        isVisibleDP
        [ FormValidation.config FormValidation.Error
            (\formData -> not (formData.dateOfBirth == Nothing))
            "You must select a date"
        ]
        |> PyxisForm.append [ appendable ]
        |> addTooltipToFieldWhen (not isVisibleDP && dateOfBirth == Nothing) (Tooltip.upConfig [] [ text "Pick the date of birth" ])


street : FormField FormData Msg
street =
    PyxisForm.textConfig
        "street"
        Nothing
        [ minlength 3, maxlength 12, class "is-large" ]
        .street
        [ Event.onInput (UpdateField Street)
        , Event.onFocus (OnFocus Street)
        , Event.onBlur (OnBlur Street)
        ]
        [ FormValidation.config FormValidation.Error
            (\formData -> formData.street /= Nothing)
            "Street can't be null"
        ]


houseNumber : FormField FormData Msg
houseNumber =
    PyxisForm.textConfig
        "houseNumber"
        (Just "n.° civico")
        [ minlength 3, maxlength 12, class "is-small" ]
        .houseNumber
        [ Event.onInput (UpdateField HouseNumber)
        , Event.onFocus (OnFocus HouseNumber)
        , Event.onBlur (OnBlur HouseNumber)
        ]
        [ FormValidation.config FormValidation.Error
            (Maybe.withDefault False << Maybe.map (not << String.isEmpty) << .houseNumber)
            "House number can't be null"
        ]


address : FormData -> FormFieldList FormData Msg
address formData =
    PyxisForm.fieldListConfig
        "Via"
        [ street, houseNumber ]
        []
        |> addTooltipToFieldListWhen formData.isFocusedAddress (Tooltip.downConfig [] [ text "Write the complete address" ])

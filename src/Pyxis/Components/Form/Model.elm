module Pyxis.Components.Form.Model exposing
    ( Field(..)
    , Model
    , Msg(..)
    , firstOfTheYear
    , initialModel
    , xMas2018
    , xMas2020
    )

import Date exposing (Date)
import Date.Extra.Core exposing (intToMonth)
import Date.Extra.Create exposing (dateFromFields)
import Prima.DatePicker as DatePicker
import Prima.Form
    exposing
        ( AutocompleteOption
        , CheckboxOption
        , RadioOption
        , SelectOption
        )


type Msg
    = FormNoOp
    | Focus Field
    | Blur Field
    | FetchTodayDate Date
      ---------------------
    | UpdateText Field (Maybe String)
    | UpdateFilter Field (Maybe String)
    | UpdateFlag Field Bool
    | UpdateDate Field DatePicker.Msg
    | UpdateMultiCheckbox Field String Bool
      ---------------------
    | Toggle Field Bool
    | ToggleDisable
      ---------------------
    | InspectHtml String
    | ClickedOutside


type alias Model =
    { textField : Maybe String
    , textFieldIcon : Maybe String
    , textFieldSmallFirst : Maybe String
    , textFieldSmallLast : Maybe String
    , textFieldLarge : Maybe String
    , textFieldTooltip : Maybe String
    , textFieldTooltipInfo : Maybe String
    , passwordField : Maybe String
    , textareaField : Maybe String
    , selectField : Maybe String
    , isSelectFieldOpen : Bool
    , checkboxField : Bool
    , checkboxMultiField : List CheckboxOption
    , radioField : Maybe String
    , datepickerField : Maybe String
    , datepicker : DatePicker.Model
    , isDatePickerOpen : Bool
    , autocompleteField : Maybe String
    , autocompleteFilter : Maybe String
    , isAutocompleteFieldOpen : Bool
    , formDisabled : Bool
    , todayDate : Maybe Date
    }


initialModel : Model
initialModel =
    Model
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        False
        False
        [ CheckboxOption "Option a" "a" False
        , CheckboxOption "Option b" "b" False
        , CheckboxOption "Option c" "c" False
        , CheckboxOption "Option d" "d" False
        ]
        Nothing
        Nothing
        (DatePicker.init firstOfTheYear ( xMas2018, xMas2020 ))
        False
        Nothing
        Nothing
        False
        False
        Nothing


xMas2018 : Date
xMas2018 =
    dateFromFields 2018 (intToMonth 12) 25 0 0 0 0


xMas2020 : Date
xMas2020 =
    dateFromFields 2020 (intToMonth 12) 25 0 0 0 0


firstOfTheYear : Date
firstOfTheYear =
    dateFromFields 2019 (intToMonth 1) 1 0 0 0 0


type Field
    = Text
    | TextIcon
    | TextSmallFirst
    | TextSmallLast
    | TextLarge
    | TextTooltip
    | TextTooltipInfo
    | Password
    | Textarea
    | Select
    | Checkbox
    | MultiCheckbox
    | Radio
    | Datepicker
    | Autocomplete

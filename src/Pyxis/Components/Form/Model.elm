module Pyxis.Components.Form.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        , initialModel
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
    | ToggleSeparation
      ---------------------
    | InspectHtml String
    | ClickedOutside


type alias Model =
    { textField : Maybe String
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
    , showSeparated : Bool
    , todayDate : Maybe Date
    }


initialModel : Model
initialModel =
    Model
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
        (DatePicker.init <| dateFromFields 2018 (intToMonth 12) 25 0 0 0 0)
        True
        Nothing
        Nothing
        False
        False
        False
        Nothing


type Field
    = Text
    | Password
    | Textarea
    | Select
    | Checkbox
    | MultiCheckbox
    | Radio
    | Datepicker
    | Autocomplete

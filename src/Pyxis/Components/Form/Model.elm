module Pyxis.Components.Form.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        , initialModel
        )

import Date exposing (Date)
import DatePicker exposing (DatePicker)
import Prima.Form
    exposing
        ( AutocompleteOption
        , CheckboxOption
        , RadioOption
        , SelectOption
        )


type Msg
    = UpdateText Field (Maybe String)
    | UpdateAutocomplete Field (Maybe String)
    | UpdateFlag Field Bool
    | UpdateDate Field DatePicker.Msg
    | UpdateMultiCheckbox Field String Bool
    | Toggle Field Bool


type alias Model =
    { textField : Maybe String
    , textareaField : Maybe String
    , selectField : Maybe String
    , isSelectFieldOpen : Bool
    , checkboxField : Bool
    , checkboxMultiField : List CheckboxOption
    , radioField : Maybe String
    , datepickerField : Maybe Date
    , datepicker : Maybe DatePicker
    , autocompleteField : Maybe String
    , autocompleteFilter : Maybe String
    , isAutocompleteFieldOpen : Bool
    }


initialModel : Model
initialModel =
    Model
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
        Nothing
        Nothing
        Nothing
        False


type Field
    = Text
    | Textarea
    | Select
    | Checkbox
    | MultiCheckbox
    | Radio
    | Datepicker
    | Autocomplete

module Pyxis.Components.Form.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        , initialModel
        )

import Date exposing (Date)
import DatePicker exposing (DatePicker)


type Msg
    = UpdateText Field (Maybe String)
    | UpdateAutocomplete Field (Maybe String)
    | UpdateFlag Field Bool
    | UpdateDate Field DatePicker.Msg


type alias Model =
    { textField : Maybe String
    , selectField : Maybe String
    , checkboxField : Bool
    , radioField : Maybe String
    , datepickerField : Maybe Date
    , datepicker : Maybe DatePicker
    , autocompleteField : Maybe String
    , autocompleteFilter : Maybe String
    }


initialModel : Model
initialModel =
    Model
        Nothing
        Nothing
        False
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing


type Field
    = Text
    | Select
    | Checkbox
    | Radio
    | Datepicker
    | Autocomplete

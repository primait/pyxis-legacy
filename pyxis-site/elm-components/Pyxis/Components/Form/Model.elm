module Pyxis.Components.Form.Model exposing
    ( Field(..)
    , Model
    , Msg(..)
    , initialModel
    )

import Prima.DatePicker as DatePicker
import Prima.Form
    exposing
        ( AutocompleteOption
        , CheckboxOption
        , RadioOption
        , SelectOption
        )
import Time


type Msg
    = FormNoOp
    | Focus Field
    | Blur Field
    | FetchTodayDate Time.Posix
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
    , datepicker : Maybe DatePicker.Model
    , isDatePickerOpen : Bool
    , autocompleteField : Maybe String
    , autocompleteFilter : Maybe String
    , isAutocompleteFieldOpen : Bool
    , formDisabled : Bool
    , todayDate : Maybe Time.Posix
    , resources : Resources
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
        Nothing
        False
        Nothing
        Nothing
        False
        False
        Nothing
        initialResources


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


type alias Resources =
    { countries : List { name : String, code : String }
    , cities : List { name : String, code : String }
    }


initialResources : Resources
initialResources =
    { countries =
        [ { name = "Aland Islands", code = "ALA" }
        , { name = "Austria", code = "AUT" }
        , { name = "Belgium", code = "BEL" }
        , { name = "Bulgaria", code = "BGR" }
        , { name = "Croatia", code = "HRV" }
        , { name = "Cyprus", code = "CYP" }
        , { name = "Czech Republic", code = "CZE" }
        , { name = "Denmark", code = "DNK" }
        , { name = "Estonia", code = "EST" }
        , { name = "Faroe Islands", code = "FRO" }
        , { name = "Finland", code = "FIN" }
        , { name = "France", code = "FRA" }
        , { name = "French Guiana", code = "GUF" }
        , { name = "Germany", code = "DEU" }
        , { name = "Gibraltar", code = "GIB" }
        , { name = "Greece", code = "GRC" }
        , { name = "Hungary", code = "HUN" }
        , { name = "Ireland", code = "IRL" }
        , { name = "Isle of Man", code = "IMN" }
        , { name = "Italy", code = "ITA" }
        , { name = "Latvia", code = "LVA" }
        , { name = "Lithuania", code = "LTU" }
        , { name = "Luxembourg", code = "LUX" }
        , { name = "Malta", code = "MLT" }
        , { name = "Netherlands", code = "NLD" }
        , { name = "Poland", code = "POL" }
        , { name = "Portugal", code = "PRT" }
        , { name = "Romania", code = "ROU" }
        , { name = "Slovakia", code = "SVK" }
        , { name = "Slovenia", code = "SVN" }
        , { name = "Spain", code = "ESP" }
        , { name = "Sweden", code = "SWE" }
        , { name = "United Kingdom of Great Britain and Northern Ireland", code = "GBR" }
        ]
    , cities =
        [ { name = "Milano", code = "MI" }
        , { name = "Torino", code = "TO" }
        , { name = "Roma", code = "RO" }
        , { name = "Napoli", code = "NA" }
        , { name = "Genova", code = "GE" }
        , { name = "Savona", code = "SA" }
        ]
    }
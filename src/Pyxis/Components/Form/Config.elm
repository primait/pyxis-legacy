module Pyxis.Components.Form.Config exposing (..)

import DatePicker exposing (DatePicker)
import Prima.Form as Form
    exposing
        ( AutocompleteOption
        , CheckboxOption
        , FormField
        , FormFieldConfig
        , RadioOption
        , SelectOption
        , Validation(..)
        )
import Pyxis.Components.Form.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        )
import Pyxis.Helpers exposing (datepickerSettings)


textFieldConfig : FormField Model Msg
textFieldConfig =
    Form.textConfig
        "text_field"
        "Text field"
        False
        []
        .textField
        (UpdateText Text)
        [ NotEmpty ]


radioFieldConfig : FormField Model Msg
radioFieldConfig =
    Form.radioConfig
        "radio_field"
        "Radio field"
        False
        []
        .radioField
        (UpdateText Radio)
        [ RadioOption "Option A" "a"
        , RadioOption "Option B" "b"
        , RadioOption "Option C" "c"
        ]
        [ NotEmpty ]


checkboxFieldConfig : FormField Model Msg
checkboxFieldConfig =
    Form.checkboxConfig
        "checkbox_field"
        "Checkbox field"
        False
        []
        .checkboxField
        (UpdateFlag Checkbox)
        []


checkboxWithOptionsFieldConfig : List CheckboxOption -> FormField Model Msg
checkboxWithOptionsFieldConfig options =
    Form.checkboxWithOptionsConfig
        "checkbox_field"
        "Checkbox field"
        False
        []
        (List.map (\option -> ( option.slug, option.isChecked )) << .checkboxMultiField)
        (UpdateMultiCheckbox MultiCheckbox)
        options
        []


selectFieldConfig : Bool -> FormField Model Msg
selectFieldConfig isOpen =
    let
        options =
            List.sortBy .label
                [ SelectOption "Milano" "MI"
                , SelectOption "Torino" "TO"
                , SelectOption "Roma" "RO"
                , SelectOption "Napoli" "NA"
                , SelectOption "Genova" "GE"
                ]
    in
    Form.selectConfig
        "select_field"
        "Select field"
        False
        isOpen
        []
        .selectField
        (Toggle Select)
        (UpdateText Select)
        options
        True
        [ NotEmpty ]


datepickerFieldConfig : DatePicker -> FormField Model Msg
datepickerFieldConfig datepicker =
    Form.datepickerConfig
        "datepicker_field"
        "Datepicker field"
        False
        .datepickerField
        (UpdateDate Datepicker)
        datepicker
        datepickerSettings
        []


autocompleteFieldConfig : Model -> FormField Model Msg
autocompleteFieldConfig ({ isAutocompleteFieldOpen } as model) =
    let
        lowerFilter =
            (String.toLower << Maybe.withDefault "" << .autocompleteFilter) model

        options =
            [ AutocompleteOption "Italy" "ITA"
            , AutocompleteOption "Brasil" "BRA"
            , AutocompleteOption "France" "FRA"
            , AutocompleteOption "Great Britain" "GBR"
            , AutocompleteOption "USA" "USA"
            , AutocompleteOption "Japan" "JAP"
            ]
                |> List.filter (String.contains lowerFilter << String.toLower << .label)
    in
    Form.autocompleteConfig
        "autocomplete_field"
        "Autocomplete field"
        False
        isAutocompleteFieldOpen
        (Just "Nessun risultato trovato. Modifica i filtri.")
        []
        .autocompleteFilter
        .autocompleteField
        (UpdateAutocomplete Autocomplete)
        (UpdateText Autocomplete)
        options
        [ NotEmpty ]

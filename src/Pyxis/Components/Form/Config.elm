module Pyxis.Components.Form.Config exposing (..)

import DatePicker exposing (DatePicker)
import Prima.Form as Form
    exposing
        ( FormField
        , FormFieldConfig
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
        [ ( "Option A", "option_a" ), ( "Option B", "option_b" ), ( "Option C", "option_c" ) ]
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


selectFieldConfig : Bool -> FormField Model Msg
selectFieldConfig isOpen =
    let
        options =
            List.sortBy Tuple.first
                [ ( "Milano", "MI" )
                , ( "Torino", "TO" )
                , ( "Roma", "RO" )
                , ( "Napoli", "NA" )
                , ( "Genova", "GE" )
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
            [ ( "Italy", "ITA" )
            , ( "Brasil", "BRA" )
            , ( "France", "FRA" )
            , ( "Great Britain", "GB" )
            , ( "USA", "USA" )
            , ( "Japan", "JAP" )
            ]
                |> List.filter (String.contains lowerFilter << String.toLower << Tuple.first)
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

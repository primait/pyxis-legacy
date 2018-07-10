module Pyxis.Components.Form.Config exposing (..)

import Date.Extra.Compare as DateCompare
import DatePicker exposing (DatePicker)
import Html.Attributes exposing (class, placeholder)
import Maybe.Extra exposing (isJust)
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
import Regex exposing (regex)


textFieldConfig : Bool -> FormField Model Msg
textFieldConfig isDisabled =
    Form.textConfig
        "text_field"
        "Text field"
        isDisabled
        [ placeholder "Write something" ]
        .textField
        (UpdateText Text)
        (Focus Text)
        (Blur Text)
        Nothing
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


textareaFieldConfig : Bool -> FormField Model Msg
textareaFieldConfig isDisabled =
    Form.textareaConfig
        "textarea_field"
        "Textarea field"
        isDisabled
        [ placeholder "Write something" ]
        .textareaField
        (UpdateText Textarea)
        (Focus Textarea)
        (Blur Textarea)
        Nothing
        [ NotEmpty "Empty value is not acceptable"
        , Custom ((<=) 10 << String.length << Maybe.withDefault "" << .textareaField) "The value must be at least 10 characters length."
        ]


radioFieldConfig : Bool -> FormField Model Msg
radioFieldConfig isDisabled =
    Form.radioConfig
        "radio_field"
        "Radio field"
        isDisabled
        []
        .radioField
        (UpdateText Radio)
        (Focus Radio)
        (Blur Radio)
        [ RadioOption "Option A" "a"
        , RadioOption "Option B" "b"
        , RadioOption "Option C" "c"
        ]
        Nothing
        [ Custom ((==) "b" << Maybe.withDefault "b" << .radioField) "You must choose `Option B`." ]


checkboxFieldConfig : Bool -> FormField Model Msg
checkboxFieldConfig isDisabled =
    Form.checkboxConfig
        "checkbox_field"
        "Checkbox field"
        isDisabled
        []
        .checkboxField
        (UpdateFlag Checkbox)
        (Focus Checkbox)
        (Blur Checkbox)
        Nothing
        []


checkboxWithOptionsFieldConfig : Model -> FormField Model Msg
checkboxWithOptionsFieldConfig model =
    let
        options =
            model.checkboxMultiField

        isDisabled =
            model.formDisabled
    in
    Form.checkboxWithOptionsConfig
        "checkbox_multifield"
        "Checkbox multi field"
        isDisabled
        []
        (List.map (\option -> ( option.slug, option.isChecked )) << .checkboxMultiField)
        (UpdateMultiCheckbox MultiCheckbox)
        (Focus MultiCheckbox)
        (Blur MultiCheckbox)
        options
        Nothing
        [ Custom
            (\{ checkboxMultiField } ->
                (List.all ((==) False) << List.map .isChecked) checkboxMultiField
                    || (isJust
                            << List.head
                            << List.filter (\{ slug, isChecked } -> slug == "b" && isChecked)
                       )
                        checkboxMultiField
            )
            "You must choose `Option B`."
        ]


selectFieldConfig : Model -> FormField Model Msg
selectFieldConfig model =
    let
        isDisabled =
            model.formDisabled

        isOpen =
            model.isSelectFieldOpen

        options =
            ((::) (SelectOption "-- Seleziona --" "")
                << List.sortBy .label
            )
                [ SelectOption "Milano" "MI"
                , SelectOption "Torino" "TO"
                , SelectOption "Roma" "RO"
                , SelectOption "Napoli" "NA"
                , SelectOption "Genova" "GE"
                , SelectOption "Savona" "SA"
                ]
    in
    Form.selectConfig
        "select_field"
        "Select field"
        isDisabled
        isOpen
        []
        .selectField
        (Toggle Select)
        (UpdateText Select)
        (Focus Select)
        (Blur Select)
        options
        Nothing
        [ Custom ((==) "SA" << Maybe.withDefault "SA" << .selectField) "You must choose `Savona`. ;)" ]


datepickerFieldConfig : Bool -> DatePicker -> FormField Model Msg
datepickerFieldConfig isDisabled datepicker =
    Form.datepickerConfig
        "datepicker_field"
        "Datepicker field"
        isDisabled
        .datepickerField
        (UpdateDate Datepicker)
        datepicker
        datepickerSettings
        Nothing
        [ Custom
            (\{ datepickerField, todayDate } ->
                (Maybe.withDefault False << Maybe.map2 (DateCompare.is DateCompare.SameOrAfter) datepickerField) todayDate
            )
            "Acceptable dates are today or in the future."
        ]


autocompleteFieldConfig : Model -> FormField Model Msg
autocompleteFieldConfig ({ isAutocompleteFieldOpen, formDisabled } as model) =
    let
        isDisabled =
            formDisabled

        countries =
            [ AutocompleteOption "Italy" "ITA"
            , AutocompleteOption "Brasil" "BRA"
            , AutocompleteOption "France" "FRA"
            , AutocompleteOption "Great Britain" "GBR"
            , AutocompleteOption "USA" "USA"
            , AutocompleteOption "Japan" "JAP"
            ]

        options =
            case model.autocompleteFilter of
                Nothing ->
                    countries

                Just f ->
                    List.filter (String.contains (String.toLower f) << String.toLower << .label) countries
    in
    Form.autocompleteConfig
        "autocomplete_field"
        "Autocomplete field"
        isDisabled
        isAutocompleteFieldOpen
        (Just "Nessun risultato trovato.")
        [ placeholder "Search your country" ]
        .autocompleteFilter
        .autocompleteField
        (UpdateFilter Autocomplete)
        (UpdateText Autocomplete)
        (Focus Autocomplete)
        (Blur Autocomplete)
        options
        Nothing
        [ NotEmpty "Empty value is not acceptable" ]

module Pyxis.Components.Form.Config exposing (..)

import Html.Attributes exposing (class, disabled, placeholder)
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
import Regex exposing (regex)


textFieldConfig : Model -> FormField Model Msg
textFieldConfig { formDisabled } =
    Form.textConfig
        "text_field"
        "Text field"
        [ placeholder "Write something", disabled formDisabled ]
        .textField
        (UpdateText Text)
        (Focus Text)
        (Blur Text)
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


passwordFieldConfig : Model -> FormField Model Msg
passwordFieldConfig { formDisabled } =
    Form.passwordConfig
        "password_field"
        "Password field"
        [ placeholder "Write something", disabled formDisabled ]
        .passwordField
        (UpdateText Password)
        (Focus Password)
        (Blur Password)
        [ NotEmpty "Empty value is not acceptable"
        , Custom ((<=) 8 << String.length << Maybe.withDefault "" << .passwordField) "The value must be at least 8 characters length."
        ]


textareaFieldConfig : Model -> FormField Model Msg
textareaFieldConfig { formDisabled } =
    Form.textareaConfig
        "textarea_field"
        "Textarea field"
        [ placeholder "Write something", disabled formDisabled ]
        .textareaField
        (UpdateText Textarea)
        (Focus Textarea)
        (Blur Textarea)
        [ NotEmpty "Empty value is not acceptable"
        , Custom ((<=) 10 << String.length << Maybe.withDefault "" << .textareaField) "The value must be at least 10 characters length."
        ]


radioFieldConfig : Model -> FormField Model Msg
radioFieldConfig { formDisabled } =
    Form.radioConfig
        "radio_field"
        "Radio field"
        [ disabled formDisabled ]
        .radioField
        (UpdateText Radio)
        (Focus Radio)
        (Blur Radio)
        [ RadioOption "Option A" "a"
        , RadioOption "Option B" "b"
        , RadioOption "Option C" "c"
        ]
        [ Custom ((==) "b" << Maybe.withDefault "b" << .radioField) "You must choose `Option B`." ]


checkboxFieldConfig : Model -> FormField Model Msg
checkboxFieldConfig { formDisabled } =
    Form.checkboxConfig
        "checkbox_field"
        "Checkbox field"
        [ disabled formDisabled ]
        .checkboxField
        (UpdateFlag Checkbox)
        (Focus Checkbox)
        (Blur Checkbox)
        []


checkboxWithOptionsFieldConfig : Model -> FormField Model Msg
checkboxWithOptionsFieldConfig model =
    let
        options =
            model.checkboxMultiField
    in
    Form.checkboxWithOptionsConfig
        "checkbox_multifield"
        "Checkbox multi field"
        [ disabled model.formDisabled ]
        (List.map (\option -> ( option.slug, option.isChecked )) << .checkboxMultiField)
        (UpdateMultiCheckbox MultiCheckbox)
        (Focus MultiCheckbox)
        (Blur MultiCheckbox)
        options
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
        isOpen =
            model.isSelectFieldOpen

        isDisabled =
            model.formDisabled

        options =
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
        (Just "Seleziona")
        [ disabled isDisabled ]
        .selectField
        (Toggle Select)
        (UpdateText Select)
        (Focus Select)
        (Blur Select)
        options
        [ Custom ((==) "SA" << Maybe.withDefault "SA" << .selectField) "You must choose `Savona`. ;)" ]


datePickerFieldConfig : Model -> FormField Model Msg
datePickerFieldConfig { datepicker, isDatePickerOpen } =
    Form.datepickerConfig
        "datepicker_field"
        "Datepicker field"
        .datepickerField
        (UpdateText Datepicker)
        (UpdateDate Datepicker)
        (Focus Datepicker)
        (Blur Datepicker)
        datepicker
        isDatePickerOpen
        [ NotEmpty "You must choose a date."
        ]


autocompleteFieldConfig : Model -> FormField Model Msg
autocompleteFieldConfig ({ isAutocompleteFieldOpen, formDisabled } as model) =
    let
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
        isAutocompleteFieldOpen
        (Just "Nessun risultato trovato.")
        [ placeholder "Search your country", disabled formDisabled ]
        .autocompleteFilter
        .autocompleteField
        (UpdateFilter Autocomplete)
        (UpdateText Autocomplete)
        (Focus Autocomplete)
        (Blur Autocomplete)
        options
        [ NotEmpty "Empty value is not acceptable" ]

module Pyxis.Components.Form.Config exposing (autocompleteFieldConfig, checkboxFieldConfig, checkboxWithOptionsFieldConfig, datePickerFieldConfig, passwordFieldConfig, radioFieldConfig, selectFieldConfig, textFieldConfig, textFieldIconConfig, textFieldLargeConfig, textFieldSmallFirstConfig, textFieldSmallLastConfig, textareaFieldConfig)

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
        (Just "Text field")
        [ placeholder "Write something", disabled formDisabled ]
        .textField
        (UpdateText Text)
        (Focus Text)
        (Blur Text)
        False
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


textFieldIconConfig : Model -> FormField Model Msg
textFieldIconConfig { formDisabled } =
    Form.textConfig
        "text_field"
        (Just "Text field icon")
        [ placeholder "Write something", disabled formDisabled ]
        .textFieldIcon
        (UpdateText TextIcon)
        (Focus TextIcon)
        (Blur TextIcon)
        False
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


textFieldSmallFirstConfig : Model -> FormField Model Msg
textFieldSmallFirstConfig { formDisabled } =
    Form.textConfig
        "text_field"
        (Just "Small text field")
        [ placeholder "From", disabled formDisabled, class "fieldSmall" ]
        .textFieldSmallFirst
        (UpdateText TextSmallFirst)
        (Focus TextSmallFirst)
        (Blur TextSmallFirst)
        False
        [ NotEmpty "Empty value is not acceptable"
        ]


textFieldSmallLastConfig : Model -> FormField Model Msg
textFieldSmallLastConfig { formDisabled } =
    Form.textConfig
        "text_field"
        Nothing
        [ placeholder "To", disabled formDisabled, class "fieldSmall" ]
        .textFieldSmallLast
        (UpdateText TextSmallLast)
        (Focus TextSmallLast)
        (Blur TextSmallLast)
        False
        [ NotEmpty "Empty value is not acceptable"
        ]


textFieldLargeConfig : Model -> FormField Model Msg
textFieldLargeConfig { formDisabled } =
    Form.textConfig
        "text_field"
        (Just "Large text field")
        [ placeholder "Something", disabled formDisabled, class "fieldLarge" ]
        .textFieldLarge
        (UpdateText TextLarge)
        (Focus TextLarge)
        (Blur TextLarge)
        False
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


passwordFieldConfig : Model -> FormField Model Msg
passwordFieldConfig { formDisabled } =
    Form.passwordConfig
        "password_field"
        (Just "Password field")
        [ placeholder "Write something", disabled formDisabled ]
        .passwordField
        (UpdateText Password)
        (Focus Password)
        (Blur Password)
        False
        [ NotEmpty "Empty value is not acceptable"
        , Custom ((<=) 8 << String.length << Maybe.withDefault "" << .passwordField) "The value must be at least 8 characters length."
        ]


textareaFieldConfig : Model -> FormField Model Msg
textareaFieldConfig { formDisabled } =
    Form.textareaConfig
        "textarea_field"
        (Just "Textarea field")
        [ placeholder "Write something", disabled formDisabled ]
        .textareaField
        (UpdateText Textarea)
        (Focus Textarea)
        (Blur Textarea)
        False
        [ NotEmpty "Empty value is not acceptable"
        , Custom ((<=) 10 << String.length << Maybe.withDefault "" << .textareaField) "The value must be at least 10 characters length."
        ]


radioFieldConfig : Model -> FormField Model Msg
radioFieldConfig { formDisabled } =
    Form.radioConfig
        "radio_field"
        (Just "Radio field")
        [ disabled formDisabled ]
        .radioField
        (UpdateText Radio)
        (Focus Radio)
        (Blur Radio)
        [ RadioOption "Option A" "a"
        , RadioOption "Option B" "b"
        , RadioOption "Option C" "c"
        ]
        False
        [ Custom ((==) "b" << Maybe.withDefault "b" << .radioField) "You must choose `Option B`." ]


checkboxFieldConfig : Model -> FormField Model Msg
checkboxFieldConfig { formDisabled } =
    Form.checkboxConfig
        "checkbox_field"
        (Just "Checkbox field")
        [ disabled formDisabled ]
        .checkboxField
        (UpdateFlag Checkbox)
        (Focus Checkbox)
        (Blur Checkbox)
        False
        []


checkboxWithOptionsFieldConfig : Model -> FormField Model Msg
checkboxWithOptionsFieldConfig model =
    let
        options =
            model.checkboxMultiField
    in
    Form.checkboxWithOptionsConfig
        "checkbox_multifield"
        (Just "Checkbox multi field")
        [ disabled model.formDisabled ]
        (List.map (\option -> ( option.slug, option.isChecked )) << .checkboxMultiField)
        (UpdateMultiCheckbox MultiCheckbox)
        (Focus MultiCheckbox)
        (Blur MultiCheckbox)
        options
        False
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
        (Just "Select field")
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
        False
        [ Custom ((==) "SA" << Maybe.withDefault "SA" << .selectField) "You must choose `Savona`. ;)" ]


datePickerFieldConfig : Model -> FormField Model Msg
datePickerFieldConfig { datepicker, isDatePickerOpen, formDisabled } =
    Form.datepickerConfig
        "datepicker_field"
        (Just "Datepicker field")
        [ disabled formDisabled, placeholder "gg/mm/aaaa" ]
        .datepickerField
        (UpdateText Datepicker)
        (UpdateDate Datepicker)
        (Focus Datepicker)
        (Blur Datepicker)
        datepicker
        isDatePickerOpen
        False
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
        (Just "Autocomplete field")
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
        False
        [ NotEmpty "Empty value is not acceptable" ]

module Pyxis.Components.Form.Config exposing
    ( autocompleteFieldConfig
    , checkboxFieldConfig
    , checkboxWithOptionsFieldConfig
    , datePickerFieldConfig
    , passwordFieldConfig
    , radioFieldConfig
    , selectFieldConfig
    , textFieldConfig
    , textFieldIconConfig
    , textFieldLargeConfig
    , textFieldSmallFirstConfig
    , textFieldSmallLastConfig
    , textFieldTooltipConfig
    , textFieldTooltipInfoConfig
    , textareaFieldConfig
    )

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


textFieldConfig : Model -> Int -> FormField Model Msg
textFieldConfig { formDisabled } tabIndex =
    Form.textConfig
        "text_field"
        (Just "Text field")
        [ placeholder "Write something", disabled formDisabled ]
        .textField
        (UpdateText Text)
        (Focus Text)
        (Blur Text)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


textFieldIconConfig : Model -> Int -> FormField Model Msg
textFieldIconConfig { formDisabled } tabIndex =
    Form.textConfig
        "text_field_icon"
        (Just "Text field icon")
        [ placeholder "Write something", disabled formDisabled ]
        .textFieldIcon
        (UpdateText TextIcon)
        (Focus TextIcon)
        (Blur TextIcon)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


textFieldSmallFirstConfig : Model -> Int -> FormField Model Msg
textFieldSmallFirstConfig { formDisabled } tabIndex =
    Form.textConfig
        "text_field_small_first"
        (Just "Small text field")
        [ placeholder "From", disabled formDisabled, class "fieldSmall" ]
        .textFieldSmallFirst
        (UpdateText TextSmallFirst)
        (Focus TextSmallFirst)
        (Blur TextSmallFirst)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


textFieldSmallLastConfig : Model -> Int -> FormField Model Msg
textFieldSmallLastConfig { formDisabled } tabIndex =
    Form.textConfig
        "text_field_small_last"
        Nothing
        [ placeholder "To", disabled formDisabled, class "fieldSmall" ]
        .textFieldSmallLast
        (UpdateText TextSmallLast)
        (Focus TextSmallLast)
        (Blur TextSmallLast)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


textFieldLargeConfig : Model -> Int -> FormField Model Msg
textFieldLargeConfig { formDisabled } tabIndex =
    Form.textConfig
        "text_field_large"
        (Just "Large text field")
        [ placeholder "Something", disabled formDisabled, class "fieldLarge" ]
        .textFieldLarge
        (UpdateText TextLarge)
        (Focus TextLarge)
        (Blur TextLarge)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        , Expression (regex "prima") "The value must contains `prima` substring."
        ]


textFieldTooltipConfig : Model -> Int -> FormField Model Msg
textFieldTooltipConfig { formDisabled } tabIndex =
    Form.textConfig
        "text_field_tooltip"
        (Just "Text field tooltip")
        [ placeholder "Write something", disabled formDisabled ]
        .textFieldTooltip
        (UpdateText TextTooltip)
        (Focus TextTooltip)
        (Blur TextTooltip)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        ]


textFieldTooltipInfoConfig : Model -> Int -> FormField Model Msg
textFieldTooltipInfoConfig { formDisabled } tabIndex =
    Form.textConfig
        "text_field_tooltip_info"
        (Just "Text field tooltip")
        [ placeholder "Write something", disabled formDisabled ]
        .textFieldTooltipInfo
        (UpdateText TextTooltipInfo)
        (Focus TextTooltipInfo)
        (Blur TextTooltipInfo)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        ]


passwordFieldConfig : Model -> Int -> FormField Model Msg
passwordFieldConfig { formDisabled } tabIndex =
    Form.passwordConfig
        "password_field"
        (Just "Password field")
        [ placeholder "Write something", disabled formDisabled ]
        .passwordField
        (UpdateText Password)
        (Focus Password)
        (Blur Password)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        , Custom ((<=) 8 << String.length << Maybe.withDefault "" << .passwordField) "The value must be at least 8 characters length."
        ]


textareaFieldConfig : Model -> Int -> FormField Model Msg
textareaFieldConfig { formDisabled } tabIndex =
    Form.textareaConfig
        "textarea_field"
        (Just "Textarea field")
        [ placeholder "Write something", disabled formDisabled ]
        .textareaField
        (UpdateText Textarea)
        (Focus Textarea)
        (Blur Textarea)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable"
        , Custom ((<=) 10 << String.length << Maybe.withDefault "" << .textareaField) "The value must be at least 10 characters length."
        ]


radioFieldConfig : Model -> Int -> FormField Model Msg
radioFieldConfig { formDisabled } tabIndex =
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
        (Just tabIndex)
        [ Custom ((==) "b" << Maybe.withDefault "b" << .radioField) "You must choose `Option B`." ]


checkboxFieldConfig : Model -> Int -> FormField Model Msg
checkboxFieldConfig { formDisabled } tabIndex =
    Form.checkboxConfig
        "checkbox_field"
        (Just "Checkbox field")
        [ disabled formDisabled ]
        .checkboxField
        (UpdateFlag Checkbox)
        (Focus Checkbox)
        (Blur Checkbox)
        False
        (Just tabIndex)
        []


checkboxWithOptionsFieldConfig : Model -> Int -> FormField Model Msg
checkboxWithOptionsFieldConfig model tabIndex =
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
        (Just tabIndex)
        [ Custom
            (\{ checkboxMultiField } ->
                (List.all ((==) False)
                    << List.map .isChecked
                )
                    checkboxMultiField
                    || (isJust
                            << List.head
                            << List.filter (\{ slug, isChecked } -> slug == "b" && isChecked)
                       )
                        checkboxMultiField
            )
            "You must choose `Option B`."
        ]


selectFieldConfig : Model -> Int -> FormField Model Msg
selectFieldConfig ({ resources } as model) tabIndex =
    let
        options =
            List.map (\{ name, code } -> SelectOption name code) resources.cities
    in
    Form.selectConfig
        "select_field"
        (Just "Select field")
        model.formDisabled
        model.isSelectFieldOpen
        (Just "Seleziona")
        [ disabled model.formDisabled ]
        .selectField
        (Toggle Select)
        (UpdateText Select)
        (Focus Select)
        (Blur Select)
        options
        False
        (Just tabIndex)
        [ Custom ((==) "SA" << Maybe.withDefault "SA" << .selectField) "You must choose `Savona`. ;)" ]


datePickerFieldConfig : Model -> Int -> FormField Model Msg
datePickerFieldConfig { datepicker, isDatePickerOpen, formDisabled } tabIndex =
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
        (Just tabIndex)
        [ NotEmpty "You must choose a date."
        ]


autocompleteFieldConfig : Model -> Int -> FormField Model Msg
autocompleteFieldConfig ({ isAutocompleteFieldOpen, formDisabled, resources } as model) tabIndex =
    let
        options =
            case model.autocompleteFilter of
                Nothing ->
                    resources.countries

                Just searchTerm ->
                    List.filter
                        (String.contains
                            (String.toLower searchTerm)
                            << String.toLower
                            << .name
                        )
                        resources.countries
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
        (List.map (\{ name, code } -> AutocompleteOption name code) options)
        False
        (Just tabIndex)
        [ NotEmpty "Empty value is not acceptable" ]

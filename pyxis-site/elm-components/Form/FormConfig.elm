module Form.FormConfig exposing
    ( address
    , city
    , country
    , dateOfBirth
    , gender
    , note
    , password
    , passwordList
    , staticHtmlField
    , username
    , visitedCountries
    )

import Form.Model
    exposing
        ( FieldName(..)
        , FormData
        , Model
        , Msg(..)
        )
import Html exposing (Html, p, text)
import Html.Attributes exposing (class, maxlength, minlength)
import Prima.Pyxis.Form as PyxisForm
    exposing
        ( FormField
        , FormFieldList
        , addTooltipToFieldListWhen
        , addTooltipToFieldWhen
        )
import Prima.Pyxis.Form.Event as Event
import Prima.Pyxis.Form.Validation as FormValidation
import Prima.Pyxis.Tooltip as Tooltip
import Pyxis.Helpers exposing (isJust)


username : FormField FormData Msg
username =
    PyxisForm.textConfig
        --Slug
        "user_name"
        --Label
        (Just "Username")
        -- Data attributes
        [ minlength 3, maxlength 12, class "is-large" ]
        --FormData accessor
        .username
        --FormEvent mappings
        [ Event.onInput (UpdateField Username)
        , Event.onFocus (OnFocus Username)
        , Event.onBlur (OnBlur Username)
        ]
        --Form Validations
        [ FormValidation.config FormValidation.Error
            (\formData -> Maybe.withDefault False <| Maybe.map ((<) 3 << String.length) formData.username)
            "Username must be greater than 3 digits"
        , FormValidation.config FormValidation.Warning
            (\formData -> not (formData.username == Just "Prisco"))
            "Dovresti lavorare più su te stesso Prisco!"
        ]


password : FormField FormData Msg
password =
    PyxisForm.passwordConfig
        "password"
        Nothing
        [ class "is-medium" ]
        .password
        [ Event.onInput (UpdateField Password) ]
        [ FormValidation.config FormValidation.Error
            (\formData -> isJust formData.password)
            "Password can't be empty"
        , FormValidation.config FormValidation.Warning
            (\formData -> not (formData.password == Just "1234"))
            "You should be more creative"
        ]


confirmPassword : FormField FormData Msg
confirmPassword =
    PyxisForm.passwordConfig
        "password_confirm"
        Nothing
        [ class "is-medium" ]
        .confirmPassword
        [ Event.onInput (UpdateField ConfirmPassword) ]
        [ FormValidation.config FormValidation.Warning
            (\formData -> formData.password == formData.confirmPassword)
            "Repeated password is not the same"
        ]


passwordList : FormFieldList FormData Msg
passwordList =
    PyxisForm.fieldListConfig
        -- Field Group label
        "Password"
        -- Field Group FormFields
        [ password, confirmPassword ]
        -- Field Group own validations
        [ FormValidation.config FormValidation.Warning
            (\formData -> not (formData.username == formData.password))
            "Username and password shouldn't be equal"
        ]


note : FormField FormData Msg
note =
    PyxisForm.textareaConfig
        "note"
        (Just "Note")
        []
        .note
        [ Event.onInput (UpdateField Note) ]
        [ FormValidation.config FormValidation.Error
            (\formData -> not (formData.note == Nothing))
            "Note shouldn't be empty"
        ]



--|> addTooltipToFieldWhen True (Tooltip.rightConfig [] [ text "You should write some interesting notes here!" ])


gender : FormField FormData Msg
gender =
    PyxisForm.radioConfig
        "gender"
        (Just "Gender")
        []
        .gender
        [ Event.onSelect (UpdateField Gender) ]
        [ PyxisForm.radioOption "Male" "male"
        , PyxisForm.radioOption "Female" "female"
        ]
        [ FormValidation.config FormValidation.Error
            (\formData -> not (formData.gender == Nothing))
            "Gender shouldn't be empty"
        ]


visitedCountries : FormData -> FormField FormData Msg
visitedCountries data =
    PyxisForm.checkboxConfig
        "visited_countries"
        (Just "Visited countries")
        []
        (List.map (\( label, slug, checked ) -> ( slug, checked )) << .visitedCountries)
        [ Event.onCheck (UpdateCheckbox VisitedCountries) ]
        (List.map (\( label, slug, checked ) -> PyxisForm.checkboxOption label slug checked) data.visitedCountries)
        [ FormValidation.config FormValidation.Error
            (\formData -> List.any (\( _, _, isSelected ) -> isSelected) formData.visitedCountries)
            "You must select one country"
        ]


city : Bool -> FormField FormData Msg
city isOpen =
    PyxisForm.selectConfig
        "city"
        (Just "Città")
        False
        isOpen
        (Just "Seleziona")
        [ class "form-small" ]
        .city
        [ Event.onToggle (Toggle City)
        , Event.onInput (UpdateField City)
        , Event.onSelect (UpdateField City)
        , Event.onFocus (OnFocus City)
        ]
        (List.sortBy .label
            [ PyxisForm.selectOption "Milan" "MI"
            , PyxisForm.selectOption "Turin" "TO"
            , PyxisForm.selectOption "Rome" "RO"
            , PyxisForm.selectOption "Naples" "NA"
            , PyxisForm.selectOption "Genoa" "GE"
            ]
        )
        [ FormValidation.config FormValidation.Error
            (\formData -> not (formData.city == Nothing))
            "You must select one city"
        ]


dateOfBirth : FormData -> Html Msg -> FormField FormData Msg
dateOfBirth { isVisibleDP, dateOfBirthDP } appendable =
    PyxisForm.datepickerConfig
        "date_of_birth"
        (Just "Date of Birth")
        [ class "is-medium" ]
        .dateOfBirth
        (UpdateDatePicker DateOfBirth)
        [ Event.onInput (UpdateField DateOfBirth) ]
        dateOfBirthDP
        isVisibleDP
        [ FormValidation.config FormValidation.Error
            (\formData -> not (formData.dateOfBirth == Nothing))
            "You must select a date"
        ]
        |> PyxisForm.append [ appendable ]



--|> addTooltipToFieldWhen True (Tooltip.upConfig [] [ text "Tooltip sul campo" ])


street : FormField FormData Msg
street =
    PyxisForm.textConfig
        "street"
        Nothing
        [ minlength 3, maxlength 12, class "is-large" ]
        .street
        [ Event.onInput (UpdateField Street)
        , Event.onFocus (OnFocus Street)
        , Event.onBlur (OnBlur Street)
        ]
        [ FormValidation.config FormValidation.Error
            (\formData -> formData.street /= Nothing)
            "Street can't be null"
        ]


houseNumber : FormField FormData Msg
houseNumber =
    PyxisForm.textConfig
        "houseNumber"
        (Just "n.° civico")
        [ minlength 3, maxlength 12, class "is-small" ]
        .houseNumber
        [ Event.onInput (UpdateField HouseNumber)
        , Event.onFocus (OnFocus HouseNumber)
        , Event.onBlur (OnBlur HouseNumber)
        ]
        [ FormValidation.config FormValidation.Error
            (Maybe.withDefault False << Maybe.map (not << String.isEmpty) << .houseNumber)
            "House number can't be null"
        ]


address : FormData -> FormFieldList FormData Msg
address formData =
    PyxisForm.fieldListConfig
        "Via"
        [ street, houseNumber ]
        []


country : FormData -> FormField FormData Msg
country { countryFilter, isOpenCountry } =
    let
        lowerFilter =
            (String.toLower << Maybe.withDefault "") countryFilter
    in
    PyxisForm.autocompleteConfig
        "country"
        (Just "Country")
        isOpenCountry
        (Just "No results")
        []
        .countryFilter
        .country
        [ Event.onAutocompleteFilter (UpdateAutocomplete Country)
        , Event.onSelect (UpdateField Country)
        , Event.onFocus (OnFocus Country)
        ]
        ([ PyxisForm.autocompleteOption "Aland Islands" "ALA"
         , PyxisForm.autocompleteOption "Austria" "AUT"
         , PyxisForm.autocompleteOption "Belgium" "BEL"
         , PyxisForm.autocompleteOption "Bulgaria" "BGR"
         , PyxisForm.autocompleteOption "Croatia" "HRV"
         , PyxisForm.autocompleteOption "Cyprus" "CYP"
         , PyxisForm.autocompleteOption "Czech Republic" "CZE"
         , PyxisForm.autocompleteOption "Denmark" "DNK"
         , PyxisForm.autocompleteOption "Estonia" "EST"
         , PyxisForm.autocompleteOption "Faroe Islands" "FRO"
         , PyxisForm.autocompleteOption "Finland" "FIN"
         , PyxisForm.autocompleteOption "France" "FRA"
         , PyxisForm.autocompleteOption "French Guiana" "GUF"
         , PyxisForm.autocompleteOption "Germany" "DEU"
         , PyxisForm.autocompleteOption "Gibraltar" "GIB"
         , PyxisForm.autocompleteOption "Greece" "GRC"
         , PyxisForm.autocompleteOption "Hungary" "HUN"
         , PyxisForm.autocompleteOption "Ireland" "IRL"
         , PyxisForm.autocompleteOption "Isle of Man" "IMN"
         , PyxisForm.autocompleteOption "Italy" "ITA"
         , PyxisForm.autocompleteOption "Latvia" "LVA"
         , PyxisForm.autocompleteOption "Lithuania" "LTU"
         , PyxisForm.autocompleteOption "Luxembourg" "LUX"
         , PyxisForm.autocompleteOption "Malta" "MLT"
         , PyxisForm.autocompleteOption "Netherlands" "NLD"
         , PyxisForm.autocompleteOption "Poland" "POL"
         , PyxisForm.autocompleteOption "Portugal" "PRT"
         , PyxisForm.autocompleteOption "Romania" "ROU"
         , PyxisForm.autocompleteOption "Slovakia" "SVK"
         , PyxisForm.autocompleteOption "Slovenia" "SVN"
         , PyxisForm.autocompleteOption "Spain" "ESP"
         , PyxisForm.autocompleteOption "Sweden" "SWE"
         , PyxisForm.autocompleteOption "United Kingdom of Great Britain and Northern Ireland" "GBR"
         ]
            |> List.filter (String.contains lowerFilter << String.toLower << .label)
        )
        [ FormValidation.config FormValidation.Error
            (\formData -> not (formData.country == Nothing))
            "Country must be selected"
        ]


staticHtmlField : FormField FormData Msg
staticHtmlField =
    PyxisForm.pureHtmlConfig
        --slug
        "always-error-field"
        [ p [] [ text "You shall not pass" ]
        ]
        [ FormValidation.config FormValidation.Error
            (\formData -> False)
            "This form field will always prints error"
        ]

module Pages.Form exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Dict exposing (Dict)
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)
import Pages.Form.Model exposing (Model, Msg(..))
import Prima.Pyxis.Form.Checkbox as Checkbox
import Prima.Pyxis.Form.CheckboxFlag as CheckboxFlag
import Prima.Pyxis.Form.Input as FormInput
import Prima.Pyxis.Form.Label as Label
import Prima.Pyxis.Form.Radio as Radio
import Prima.Pyxis.Form.RadioButton as RadioButton
import Prima.Pyxis.Form.RadioFlag as RadioFlag
import Prima.Pyxis.Form.TextArea as TextArea
import Set exposing (Set)



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "form-page" ]
        [ ComponentPage.view
            { title = "Form"
            , description = "Page under construction"
            , specs = Nothing
            , sections = []
            }
        , viewForm model
        ]


viewForm : Model -> Html Msg
viewForm model =
    div []
        (fieldsConfig
            |> List.map
                (\config ->
                    ComponentViewer.view
                        { id = config.title
                        , isCodeVisible = ComponentPage.isInspecting config.title model
                        , onTogglePreview = ToggleInspect
                        , boxType = Box.Light
                        , label = config.title
                        , example = "TODO"
                        }
                        [ config.view model
                        ]
                )
        )


fieldsConfig : List { title : String, view : Model -> Html Msg }
fieldsConfig =
    [ { title = "Label", view = viewLabel }
    , { title = "Input", view = viewInput }
    , { title = "Textarea", view = viewTextarea }
    , { title = "Checkbox", view = viewCheckbox }
    , { title = "Checkbox Flag", view = viewCheckboxFlag }
    , { title = "Radio", view = viewRadio }
    , { title = "Radio Flag", view = viewRadioFlag }
    , { title = "Radio Button", view = viewRadioButton }
    , { title = "Autocomplete", view = viewAutocomplete }
    , { title = "Select", view = viewSelect }
    , { title = "Filterable Select", view = viewFilterableSelect }
    , { title = "Date Picker", view = viewDate }
    , { title = "Validation", view = viewValidation }
    ]


viewLabel : Model -> Html Msg
viewLabel model =
    Html.label [] [ Html.text "Label" ]


viewInput : Model -> Html Msg
viewInput model =
    div []
        (FormInput.text (Dict.get "text-field") (UpdateStringField "text-field")
            |> FormInput.render model.form.strData
        )


viewTextarea : Model -> Html Msg
viewTextarea model =
    div []
        (TextArea.textArea (Dict.get "textarea") (UpdateStringField "textarea")
            |> TextArea.render model.form.strData
        )


viewCheckbox : Model -> Html Msg
viewCheckbox model =
    let
        options =
            [ Checkbox.checkboxChoice "value1" "Checkbox 1"
            , Checkbox.checkboxChoice "value2" "Checkbox 2"
            , Checkbox.checkboxChoice "value3" "Checkbox 3"
            ]
    in
    div []
        (Checkbox.checkbox (Dict.get "checkbox1" >> Maybe.withDefault Set.empty >> Set.toList) (ToggleStringSet "checkbox1") options
            |> Checkbox.render model.form.stringSets
        )


viewCheckboxFlag : Model -> Html Msg
viewCheckboxFlag model =
    let
        id =
            "checkbox-flag1"
    in
    div []
        (CheckboxFlag.flag (Dict.get id) (ToggleBoolField id) id
            |> CheckboxFlag.withLabel (Label.label "Checkbox")
            |> CheckboxFlag.render model.form.boolData
        )


viewRadio : Model -> Html Msg
viewRadio model =
    let
        options =
            [ Radio.radioChoice "value1" "Radio 1"
            , Radio.radioChoice "value2" "Radio 2"
            , Radio.radioChoice "value3" "Radio 3"
            ]
    in
    div []
        (Radio.radio (Dict.get "radio1") (UpdateStringField "radio1") options
            |> Radio.render model.form.strData
        )


viewRadioFlag : Model -> Html Msg
viewRadioFlag model =
    let
        id =
            "radio-flag1"
    in
    div []
        (RadioFlag.radioFlagLight (Dict.get id) (ToggleBoolField id)
            |> RadioFlag.render model.form.boolData
        )


viewRadioButton : Model -> Html Msg
viewRadioButton model =
    let
        choices =
            [ RadioButton.radioButtonChoice "value1" "RadioButton 1"
            , RadioButton.radioButtonChoice "value2" "RadioButton 2"
            , RadioButton.radioButtonChoice "value3" "RadioButton 3"
            ]
    in
    div []
        (RadioButton.radioButton (Dict.get "radiobutton") (UpdateStringField "radiobutton") choices
            |> RadioButton.render model.form.strData
        )


viewAutocomplete : Model -> Html Msg
viewAutocomplete model =
    Html.text "TODO"


viewSelect : Model -> Html Msg
viewSelect model =
    Html.text "TODO"


viewFilterableSelect : Model -> Html Msg
viewFilterableSelect model =
    Html.text "TODO"


viewDate : Model -> Html Msg
viewDate model =
    Html.text "TODO"


viewValidation : Model -> Html Msg
viewValidation model =
    Html.text "TODO"

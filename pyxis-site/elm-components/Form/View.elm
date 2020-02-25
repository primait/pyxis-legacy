module Form.View exposing (view)

import Form.FormConfig as Config
import Form.Model exposing (FormData, Model, Msg(..))
import Html exposing (Html, div, hr, i, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Prima.Pyxis.Button as Button
import Prima.Pyxis.Form as PyxisForm


view : Model -> Html Msg
view { data, formConfig } =
    div
        [ class "a-container directionColumn" ]
        [ btnSwitchValidationMode formConfig
        , p [] [ text <| Maybe.withDefault "" <| Maybe.map ((++) "Form current state: ") (formStateLabel formConfig) ]
        , p [] [ text <| formValidationPolicyLabel formConfig ]
        , formConfig
            |> PyxisForm.addField Config.username
            |> PyxisForm.addFieldList Config.passwordList
            |> PyxisForm.addField Config.note
            |> PyxisForm.addField Config.gender
            |> PyxisForm.addField (Config.visitedCountries data)
            |> PyxisForm.addField (Config.country data)
            |> PyxisForm.addField (Config.dateOfBirth data datePickerIcon)
            |> PyxisForm.addField Config.staticHtmlField
            |> PyxisForm.addCustomRow (div [] [ text "Some fancy text in the middle of your form", hr [] [] ])
            |> PyxisForm.addFieldList (Config.address data)
            |> PyxisForm.addField (Config.city data.isOpenCity)
            |> PyxisForm.render data
        , btnWrapper
            [ btnSubmit
            , btnReset
            ]
        ]


btnWrapper : List (Html Msg) -> Html Msg
btnWrapper =
    div [ class "m-btnGroup alignCenter justifyContentCenter" ]


btnSubmit : Html Msg
btnSubmit =
    Button.callOut Button.Brand "Submit" Submit
        |> Button.render True


btnReset : Html Msg
btnReset =
    Button.secondary Button.Brand "Reset" Reset
        |> Button.render True


btnSwitchValidationMode : PyxisForm.Form model msg -> Html Msg
btnSwitchValidationMode form =
    let
        tuple =
            case PyxisForm.pickValidationVisibilityPolicy form of
                PyxisForm.Always ->
                    ( "Validate when submitted", ChangeValidationPolicy PyxisForm.WhenSubmitted )

                PyxisForm.WhenSubmitted ->
                    ( "Validate always", ChangeValidationPolicy PyxisForm.Always )

        label =
            Tuple.first tuple

        event =
            Tuple.second tuple
    in
    Button.secondary Button.Brand label event
        |> Button.render True


datePickerIcon : Html Msg
datePickerIcon =
    i
        [ class "a-icon a-icon-calendar cBrandAltDark"
        , onClick ToggleDatePicker
        ]
        []


formStateLabel : PyxisForm.Form model msg -> Maybe String
formStateLabel form =
    if PyxisForm.isFormPristine form then
        Just "Pristine"

    else if PyxisForm.isFormTouched form then
        Just "Touched"

    else if PyxisForm.isFormSubmitted form then
        Just "Submitted"

    else
        Nothing


formValidationPolicyLabel : PyxisForm.Form model msg -> String
formValidationPolicyLabel form =
    case PyxisForm.pickValidationVisibilityPolicy form of
        PyxisForm.Always ->
            "Form always prints validations"

        PyxisForm.WhenSubmitted ->
            "Form validates after submit"

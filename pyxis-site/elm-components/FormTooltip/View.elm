module FormTooltip.View exposing (view)

import FormTooltip.FormConfig as Config
import FormTooltip.Model exposing (FormData, Model, Msg(..))
import Html exposing (Html, div, hr, i, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Prima.Pyxis.Form as PyxisForm


view : Model -> Html Msg
view { data, formConfig } =
    div
        [ class "a-container directionColumn" ]
        [ formConfig
            |> PyxisForm.addField (Config.dateOfBirthField data datePickerIcon)
            |> PyxisForm.addFieldList (Config.address data)
            |> PyxisForm.render data
        ]


datePickerIcon : Html Msg
datePickerIcon =
    i
        [ class "a-icon a-icon-calendar cBrandAltDark"
        , onClick ToggleDatePicker
        ]
        []

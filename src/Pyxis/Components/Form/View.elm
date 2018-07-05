module Pyxis.Components.Form.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Prima.Form as Form
import Pyxis.Components.Form.Config exposing (..)
import Pyxis.Components.Form.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.Helpers
    exposing
        ( divider
        , renderOrNothing
        )


view : Model -> List (Html Msg)
view ({ datepicker } as model) =
    let
        isDisabled =
            model.formDisabled

        render config =
            Form.render model config
    in
    [ h2 [ class "pySubtitle" ] [ text "Form components" ]
    , divider
    , textFieldConfig isDisabled |> render
    , textareaFieldConfig isDisabled |> render
    , Maybe.map (render << datepickerFieldConfig isDisabled) datepicker |> renderOrNothing
    , autocompleteFieldConfig model |> render
    , radioFieldConfig isDisabled |> render
    , selectFieldConfig model |> render
    , checkboxFieldConfig isDisabled |> render
    , checkboxWithOptionsFieldConfig model |> render
    , btnGroup
        [ btnToggleDisable model
        ]
    ]


btnGroup : List (Html Msg) -> Html Msg
btnGroup =
    div
        [ class "m-btnGroup" ]


btnToggleDisable : Model -> Html Msg
btnToggleDisable { formDisabled } =
    button
        [ class "a-btn a-btn--primary"
        , onClick ToggleDisable
        ]
        [ if formDisabled then
            text "Enable form"
          else
            text "Disable form"
        ]

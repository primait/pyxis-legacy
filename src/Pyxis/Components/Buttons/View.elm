module Pyxis.Components.Buttons.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Pyxis.Components.Buttons.Model
    exposing
        ( Btn
        , BtnType(..)
        , Model
        , Msg(..)
        , btnTypeToString
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        , inspectableHtml
        , renderOrNothing
        )


view : Model -> List (Html Msg)
view model =
    let
        pickBtn : BtnType -> Maybe Btn
        pickBtn type_ =
            (List.head << List.filter ((==) type_ << .type_)) model.buttons

        primaryBtn =
            pickBtn Primary

        secondaryBtn =
            pickBtn Secondary

        tertiaryBtn =
            pickBtn Tertiary

        circleBtn =
            pickBtn Circle

        renderBtn : Maybe Btn -> List (Html Msg)
        renderBtn =
            List.singleton << renderOrNothing << Maybe.map btn
    in
    [ componentTitle [ text "Buttons" ]
    , divider
    , (componentShowdown "Btn primary" "btnPrimary" InspectHtml << renderBtn) primaryBtn
    , (componentShowdown "Btn secondary" "btnSecondary" InspectHtml << renderBtn) secondaryBtn
    , (componentShowdown "Btn tertiary" "btnTertiary" InspectHtml << renderBtn) tertiaryBtn
    , (componentShowdown "Btn circle" "btnCircle" InspectHtml << renderBtn) circleBtn
    , (componentShowdown "Btn group" "btnGroup" InspectHtml << (List.singleton << btnGroup << List.map btn)) model.buttons
    ]


btnGroup : List (Html Msg) -> Html Msg
btnGroup =
    div
        [ class "m-btnGroup" ]


btn : Btn -> Html Msg
btn { label, type_, isDisabled } =
    button
        [ classList
            [ ( "a-btn", True )
            , ( ((++) "a-btn--" << btnTypeToString) type_, True )
            , ( "is-disabled", isDisabled )
            ]
        ]
        [ text label
        ]

module Pyxis.Components.Buttons.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Pyxis.Components.Buttons.Model
    exposing
        ( Btn
        , BtnType(..)
        , Model
        , Msg(..)
        , attentionBtn
        , btnTypeToString
        , circleBtn
        , primaryBtn
        , secondaryBtn
        , tertiaryBtn
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
        renderBtn : Btn -> List (Html Msg)
        renderBtn =
            List.singleton << btn

        renderBtnList : List Btn -> List (Html Msg)
        renderBtnList =
            List.singleton << btnGroup << List.map btn
    in
    [ componentTitle [ text "Buttons" ]
    , divider
    , (componentShowdown "Btn primary" "btnPrimary" InspectHtml << renderBtn) primaryBtn
    , (componentShowdown "Btn secondary" "btnSecondary" InspectHtml << renderBtn) secondaryBtn
    , (componentShowdown "Btn tertiary" "btnTertiary" InspectHtml << renderBtn) tertiaryBtn
    , (componentShowdown "Btn attention" "btnAttention" InspectHtml << renderBtn) attentionBtn
    , (componentShowdown "Btn circle" "btnCircle" InspectHtml << renderBtn) circleBtn
    , (componentShowdown "Btn group" "btnGroup" InspectHtml << renderBtnList) [ primaryBtn, secondaryBtn, tertiaryBtn ]
    ]


btnGroup : List (Html Msg) -> Html Msg
btnGroup =
    div
        [ class "m-btnGroup" ]


btn : Btn -> Html Msg
btn { label, type_, icon, isDisabled } =
    button
        [ classList
            [ ( "a-btn", True )
            , ( ((++) "a-btn--" << btnTypeToString) type_, True )
            , ( "is-disabled", isDisabled )
            ]
        ]
        [ text label
        , (Maybe.withDefault (text "") << Maybe.map renderIcon) icon
        ]


renderIcon : String -> Html Msg
renderIcon iconName =
    i
        [ class <| "a-icon a-icon-" ++ iconName ]
        []

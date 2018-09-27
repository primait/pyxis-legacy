module Pyxis.Components.Typography.View exposing (view)

import Html exposing (..)
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers exposing (componentTitle, divider, renderOrNothing)


view : Model -> List (Html Msg)
view model =
    let
        renderText : (List (Attribute Msg) -> List (Html Msg) -> Html Msg) -> Html Msg
        renderText tagName =
            tagName [] [ text "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ]
    in
    [ componentTitle [ text "Typography" ]
    , divider
    ]
        ++ (List.intersperse divider << List.map renderText) [ h1, h2, h3, h4, p ]


renderText : (List (Attribute Msg) -> List (Html Msg) -> Html Msg) -> Html Msg
renderText tagName =
    tagName [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]

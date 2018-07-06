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
            tagName [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    in
    [ componentTitle [ text "Typography" ]
    , divider
    ]
        ++ (List.intersperse divider << List.map renderText) [ h1, h2, h3, h4, h5, h6, p ]


renderText : (List (Attribute Msg) -> List (Html Msg) -> Html Msg) -> Html Msg
renderText tagName =
    tagName [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]

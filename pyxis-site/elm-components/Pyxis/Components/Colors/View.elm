module Pyxis.Components.Colors.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList)
import Html.Events exposing (onClick)
import Pyxis.Components.Colors.Model
    exposing
        ( Color
        , ColorTone(..)
        , Model
        , Msg(..)
        , colorToneToString
        )
import Pyxis.ViewHelpers exposing (componentTitle, divider, renderOrNothing)


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Color scheme" ]
    , divider
    , colorList model.colors
    ]


colorList : List Color -> Html Msg
colorList colors =
    ul
        [ class "pyColorScheme" ]
        (List.map colorItem colors)


colorItem : Color -> Html Msg
colorItem color =
    li
        [ class "pyColorScheme__item"
        , attribute "data-color" color.name
        ]
        (List.map (colorTone color) color.tones)


colorTone : Color -> ColorTone -> Html Msg
colorTone color tone =
    div
        [ classList
            [ ( "pyColorScheme__item__tone", True )
            , ( String.join "-" [ "bg", color.name, colorToneToString tone ], True )
            ]
        , (onClick << PickTone color) tone
        ]
        [ span [ class "pyColorScheme__item__tone__name" ] [ (text << colorToneToString) tone ]
        ]

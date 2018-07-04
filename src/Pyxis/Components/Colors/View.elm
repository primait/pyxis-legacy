module Pyxis.Components.Colors.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList)
import Pyxis.Components.Colors.Model
    exposing
        ( Color
        , ColorTone(..)
        , Model
        , colorToneToString
        )
import Pyxis.Helpers
    exposing
        ( divider
        , renderOrNothing
        )


view : Model -> List (Html msg)
view model =
    [ h2 [] [ text "Color scheme" ]
    , divider
    , colorList model.colors
    ]


colorList : List Color -> Html msg
colorList colors =
    ul
        [ class "colorScheme" ]
        (List.map colorItem colors)


colorItem : Color -> Html msg
colorItem color =
    li
        [ class "colorScheme__item"
        , attribute "data-color" color.name
        ]
        (List.map (colorTone color) color.tones)


colorTone : Color -> ColorTone -> Html msg
colorTone color tone =
    div
        [ classList
            [ ( "colorScheme__item__tone", True )
            , ( String.join "-" [ "bg", color.name, colorToneToString tone ], True )
            ]
        ]
        [ (text << colorToneToString) tone
        ]

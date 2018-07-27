module Pyxis.Components.Tooltips.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Pyxis.Components.Tooltips.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.Helpers exposing (capitalize)
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        , inspectableHtml
        )


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Tooltips" ]
    , divider
    ]
        ++ List.map
            (\direction ->
                (componentShowdown
                    ("Tooltip " ++ capitalize direction)
                    ("tooltip" ++ capitalize direction)
                    InspectHtml
                    << List.singleton
                    << div [ class "pyTooltipHolder" ]
                    << List.singleton
                    << tooltip
                )
                    direction
            )
            [ "up", "down", "left", "right" ]


tooltip : String -> Html Msg
tooltip direction =
    div
        [ classList
            [ ( "tooltip", True )
            , ( "tooltip--" ++ direction, True )
            ]
        ]
        [ p
            []
            [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa." ]
        ]

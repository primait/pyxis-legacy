module Pyxis.Components.Lists.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Pyxis.Components.Lists.Model
    exposing
        ( Model
        , Msg(..)
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
    [ componentTitle [ text "Lists" ]
    , divider
    , componentShowdown "List DirectionColumn" "ListDirectionColumn" InspectHtml [ list "directionColumn" ]
    , componentShowdown "List DirectionRow" "ListDirectionRow" InspectHtml [ list "directionRow" ]
    , componentShowdown "Sublist DirectionColumn" "SublistDirectionColumn" InspectHtml [ sublist "directionColumn" "directionColumn" ]
    , componentShowdown "Sublist DirectionRow" "SublistDirectionRow" InspectHtml [ sublist "directionRow" "directionRow" ]
    ]


list : String -> Html Msg
list directionFlex =
    ul
        [ class <| "m-list " ++ directionFlex ]
        [ listItem
            [ text "Ciao" ]
        , listItem
            [ text "Hello" ]
        , listItem
            [ text "Bonjour" ]
        ]


sublist : String -> String -> Html Msg
sublist directionFlex directionFlexSublist =
    ul
        [ class <| "m-list " ++ directionFlex ]
        [ listItem
            [ text "Ciao" ]
        , listItem
            [ text "Hello"
            , listItem
                [ list directionFlexSublist ]
            ]
        ]


listItem : List (Html Msg) -> Html Msg
listItem arg =
    li
        [ class "a-list__item" ]
        arg

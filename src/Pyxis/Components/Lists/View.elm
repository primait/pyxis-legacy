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
        )


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Lists" ]
    , divider
    , componentShowdown "List Direction Column Type Disc" "ListDirectionColumn" InspectHtml [ list "directionColumn" "" ]
    , componentShowdown "List Direction Column" "ListDirectionRow" InspectHtml [ list "directionRow" "noListStyle" ]
    , componentShowdown "List Direction Row" "ListDirectionRow" InspectHtml [ list "directionRow" "noListStyle" ]
    , componentShowdown "Sublist Direction Column" "SublistDirectionColumn" InspectHtml [ sublist "directionColumn" "noListStyle" "directionColumn" "noListStyle" ]
    , componentShowdown "Sublist Direction Row" "SublistDirectionRow" InspectHtml [ sublist "directionRow" "noListStyle" "directionRow" "noListStyle" ]
    ]


list : String -> String -> Html Msg
list directionFlex noType =
    ul
        [ classList
            [ ( "m-list", True )
            , ( directionFlex, True )
            , ( noType, True )
            ]
        ]
        (List.map (listItem << List.singleton << text) [ "Ciao", "Hello", "Bonjour" ])


sublist : String -> String -> String -> String -> Html Msg
sublist directionFlex noType directionFlexSublist noTypeSublist =
    ul
        [ classList
            [ ( "m-list", True )
            , ( directionFlex, True )
            , ( noType, True )
            ]
        ]
        [ listItem [ text "Ciao" ]
        , listItem
            [ text "Hello"
            , listItem [ list directionFlexSublist noTypeSublist ]
            ]
        ]


listItem : List (Html Msg) -> Html Msg
listItem arg =
    li
        [ class "a-list__item" ]
        arg

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
    , componentShowdown "List Direction Column" "ListDirectionRow" InspectHtml [ list "directionRow" "no-list-type" ]
    , componentShowdown "List Direction Row" "ListDirectionRow" InspectHtml [ list "directionRow" "no-list-type" ]
    , componentShowdown "Sublist Direction Column" "SublistDirectionColumn" InspectHtml [ sublist "directionColumn" "no-list-type" "directionColumn" "no-list-type" ]
    , componentShowdown "Sublist Direction Row" "SublistDirectionRow" InspectHtml [ sublist "directionRow" "no-list-type" "directionRow" "no-list-type" ]
    ]


list : String -> String -> Html Msg
list directionFlex noListStyle =
    ul
        [ classList
            [ ( "m-list", True )
            , ( directionFlex, True )
            , ( "m-list--" ++ noListStyle, True )
            ]
        ]
        (List.map (listItem << List.singleton << text) [ "Ciao", "Hello", "Bonjour" ])


sublist : String -> String -> String -> String -> Html Msg
sublist directionFlex noListStyle directionFlexSublist noListStyleSublist =
    ul
        [ classList
            [ ( "m-list", True )
            , ( directionFlex, True )
            , ( "m-list--" ++ noListStyle, True )
            ]
        ]
        [ listItem [ text "Ciao" ]
        , listItem
            [ text "Hello"
            , listItem [ list directionFlexSublist noListStyleSublist ]
            ]
        ]


listItem : List (Html Msg) -> Html Msg
listItem arg =
    li
        [ class "a-list__item" ]
        arg

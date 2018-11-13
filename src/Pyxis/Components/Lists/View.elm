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
    , componentShowdown "List Direction Column" "ListDirectionRow" InspectHtml [ list "directionRow" "no-pointers" ]
    , componentShowdown "List Direction Row" "ListDirectionRow" InspectHtml [ list "directionRow" "no-pointers" ]
    , componentShowdown "Sublist Direction Column" "SublistDirectionColumn" InspectHtml [ sublist "directionColumn" "no-pointers" "directionColumn" "no-pointers" ]
    , componentShowdown "Sublist Direction Row" "SublistDirectionRow" InspectHtml [ sublist "directionRow" "no-pointers" "directionRow" "no-pointers" ]
    ]


list : String -> String -> Html Msg
list directionFlex noPointers =
    ul
        [ classList
            [ ( "m-list", True )
            , ( directionFlex, True )
            , ( "m-list--" ++ noPointers, True )
            ]
        ]
        (List.map (listItem << List.singleton << text) [ "Ciao", "Hello", "Bonjour" ])


sublist : String -> String -> String -> String -> Html Msg
sublist directionFlex noPointers directionFlexSublist noPointersSublist =
    ul
        [ classList
            [ ( "m-list", True )
            , ( directionFlex, True )
            , ( "m-list--" ++ noPointers, True )
            ]
        ]
        [ listItem [ text "Ciao" ]
        , listItem
            [ text "Hello"
            , listItem [ list directionFlexSublist noPointersSublist ]
            ]
        ]


listItem : List (Html Msg) -> Html Msg
listItem arg =
    li
        [ class "a-list__item" ]
        arg

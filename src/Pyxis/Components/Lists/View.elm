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
    , componentShowdown "List Direction Column Type Disc" "ListDirectionColumn" InspectHtml [ list Nothing Nothing ]
    , componentShowdown "List Direction Column" "ListDirectionRow" InspectHtml [ list Nothing (Just "m-list--no-pointers") ]
    , componentShowdown "List Direction Row" "ListDirectionRow" InspectHtml [ list (Just "directionRow") (Just "m-list--no-pointers") ]
    , componentShowdown "Sublist Direction Row" "SublistDirectionRow" InspectHtml [ sublist (Just "directionRow") (Just "m-list--no-pointers") (Just "directionRow") (Just "m-list--no-pointers") ]
    , componentShowdown "Sublist Direction Column" "SublistDirectionColumn" InspectHtml [ sublist Nothing (Just "no-pointers") Nothing (Just "m-list--no-pointers") ]
    ]


list : Maybe String -> Maybe String -> Html Msg
list directionClass pointersClass =
    ul
        [ classList
            [ ( "m-list", True )
            , ( Maybe.withDefault "directionColumn" directionClass, True )
            , ( Maybe.withDefault "" pointersClass, True )
            ]
        ]
        (List.map (listItem << List.singleton << text) [ "Ciao", "Hello", "Bonjour" ])


sublist : Maybe String -> Maybe String -> Maybe String -> Maybe String -> Html Msg
sublist directionClass pointersClass directionClassSublist pointersClassSublist =
    ul
        [ classList
            [ ( "m-list", True )
            , ( Maybe.withDefault "directionColumn" directionClass, True )
            , ( Maybe.withDefault "" pointersClass, True )
            ]
        ]
        [ listItem [ text "Ciao" ]
        , listItem
            [ text "Hello"
            , listItem [ list directionClassSublist pointersClassSublist ]
            ]
        ]


listItem : List (Html Msg) -> Html Msg
listItem arg =
    li
        [ class "a-list__item" ]
        arg

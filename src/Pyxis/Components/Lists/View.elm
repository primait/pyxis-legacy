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
    , componentShowdown "Default list" "defaultList" InspectHtml [ list ]
    ]


list : Html Msg
list =
    ul
        [ class "m-list" ]
        (List.map listItem [ "Ciao", "Hello", "Bonjour" ])


listItem : String -> Html Msg
listItem str =
    li
        [ class "a-list__item" ]
        [ text str ]

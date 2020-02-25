module Pyxis.Helpers exposing
    ( isJust
    , loremIpsum
    , spacer
    , syntaxWrapper
    )

import Html exposing (Html, br, div)
import Html.Attributes exposing (class, href, id, rel)


syntaxWrapper : List (Html msg) -> Html msg
syntaxWrapper =
    div
        [ class "a-container a-container--medium directionColumn"
        , id "syntaxWrapper"
        ]


loremIpsum : String
loremIpsum =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut."


spacer : Html msg
spacer =
    br [] []


isJust : Maybe a -> Bool
isJust v =
    case v of
        Just _ ->
            True

        Nothing ->
            False

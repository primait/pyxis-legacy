module Pyxis.Helpers exposing
    ( loremIpsum
    , pyxisStyle
    , spacer
    , syntaxWrapper
    )

import Html exposing (Html, br, div)
import Html.Attributes exposing (class, href, id, rel)


pyxisStyle : Html msg
pyxisStyle =
    Html.node "link" [ href "https://d3be8952cnveif.cloudfront.net/pyxis/1.8.14/prima.css", rel "stylesheet" ] []


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

module Pyxis.Helpers exposing
    ( elmSyntaxWrapper
    , loremIpsum
    , pyxisStyle
    , spacer
    )

import Html exposing (Html, br, div)
import Html.Attributes exposing (class, href, id, rel)


pyxisStyle : Html msg
pyxisStyle =
    Html.node "link" [ href "https://d3be8952cnveif.cloudfront.net/css/pyxis-1.7.4.css", rel "stylesheet" ] []


elmSyntaxWrapper : List (Html msg) -> Html msg
elmSyntaxWrapper =
    div
        [ class "a-container a-container--medium directionColumn"
        , id "elmSyntaxWrapper"
        ]


loremIpsum : String
loremIpsum =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut."


spacer : Html msg
spacer =
    br [] []

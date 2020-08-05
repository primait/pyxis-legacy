module Route exposing
    ( Route(..)
    , fromUrl
    , toString
    )

import Url exposing (Url)
import Url.Parser exposing (map, oneOf, parse, s)


type Route
    = Homepage
    | Accordion
    | Button
    | NotFound


fromUrl : Url -> Maybe Route
fromUrl =
    parse <|
        oneOf
            [ Url.Parser.map Homepage Url.Parser.top
            , Url.Parser.map Accordion (s "accordion")
            , Url.Parser.map Button (s "button")
            , Url.Parser.map NotFound (s "404")
            ]


toString : Route -> String
toString route =
    "#/" ++ String.join "/" (routeToPieces route)


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Homepage ->
            []

        Accordion ->
            [ "accordion" ]

        Button ->
            [ "button" ]

        NotFound ->
            [ "404" ]

module Pyxis.Router exposing
    ( Route(..)
    , fromUrl
    , parser
    , routeToPieces
    )

import Url exposing (Url)
import Url.Parser exposing (s)


type Route
    = Homepage
    | Accordion
    | NotFound


parser : Url.Parser.Parser (Route -> a) a
parser =
    Url.Parser.oneOf
        [ Url.Parser.map Homepage Url.Parser.top
        , Url.Parser.map Accordion (s "accordion")
        , Url.Parser.map NotFound (s "404")
        ]


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Homepage ->
            []

        Accordion ->
            [ "accordion" ]

        NotFound ->
            [ "404" ]


fromUrl : Url -> Maybe Route
fromUrl =
    Url.Parser.parse parser

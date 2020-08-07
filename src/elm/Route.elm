module Route exposing
    ( Route(..)
    , fromUrl
    , href
    , pushUrl
    )

import Browser.Navigation as Nav
import Html
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser exposing (Parser, map, oneOf, parse, s)


type Route
    = Homepage
    | Accordion
    | Button
    | NotFound


href : Route -> Html.Attribute msg
href route =
    Attr.href (routeToString route)


pushUrl : Nav.Key -> Maybe Route -> Cmd msg
pushUrl key maybeRoute =
    case maybeRoute of
        Nothing ->
            Cmd.none

        Just route ->
            Nav.pushUrl key (routeToString route)


fromUrl : Url -> Maybe Route
fromUrl url =
    url |> Url.Parser.parse parser



-- PRIVATE HELPERS


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Url.Parser.map Homepage Url.Parser.top
        , Url.Parser.map Accordion (s "accordion")
        , Url.Parser.map Button (s "button")
        , Url.Parser.map NotFound (s "404")
        ]


routeToString : Route -> String
routeToString route =
    "/" ++ String.join "/" (routeToPieces route)


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

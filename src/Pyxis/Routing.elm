module Pyxis.Routing exposing (..)

import Navigation exposing (Location)
import Pyxis.Model
    exposing
        ( Model
        , Route(..)
        )
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map ColorsRoute (s "colors")
        , map TypographyRoute (s "typography")
        , map ButtonsRoute (s "buttons")
        , map FormRoute (s "form")
        , map HeaderRoute (s "header")
        , map LoaderRoute (s "loader")
        , map MessagesRoute (s "messages")
        , map FooterRoute (s "footer")
        , map TooltipsRoute (s "tooltips")
        , map LoginRoute (s "login")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute

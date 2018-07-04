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
        , map FormRoute (s "form")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute

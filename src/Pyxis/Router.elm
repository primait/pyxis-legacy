module Pyxis.Router exposing
    ( routeParser
    , routeToString
    , routeToUrl
    , stringToRoute
    , urlToRoute
    )

import Browser exposing (..)
import Pyxis.Model
    exposing
        ( Model
        , Route(..)
        )
import Url exposing (Url)
import Url.Builder
import Url.Parser exposing ((</>), Parser, map, oneOf, parse, s, string, top)


routeParser : Parser (Route -> something) something
routeParser =
    oneOf
        [ map HomeRoute top
        , map ColorsRoute (s "colors")
        , map TypographyRoute (s "typography")
        , map AccordionsRoute (s "accordions")
        , map ButtonsRoute (s "buttons")
        , map FormRoute (s "form")
        , map LoaderRoute (s "loader")
        , map MessagesRoute (s "messages")
        , map TooltipsRoute (s "tooltips")
        , map LoginRoute (s "login")
        , map ListsRoute (s "lists")
        , map JumbotronRoute (s "jumbotron")
        ]


urlToRoute : Url -> Route
urlToRoute =
    Maybe.withDefault NotFoundRoute << parse routeParser


routeToString : Route -> String
routeToString route =
    case route of
        HomeRoute ->
            Url.Builder.relative [ "/" ] []

        ColorsRoute ->
            Url.Builder.relative [ "colors" ] []

        TypographyRoute ->
            Url.Builder.relative [ "typography" ] []

        AccordionsRoute ->
            Url.Builder.relative [ "accordions" ] []

        ButtonsRoute ->
            Url.Builder.relative [ "buttons" ] []

        FormRoute ->
            Url.Builder.relative [ "form" ] []

        LoaderRoute ->
            Url.Builder.relative [ "loader" ] []

        MessagesRoute ->
            Url.Builder.relative [ "messages" ] []

        TooltipsRoute ->
            Url.Builder.relative [ "tooltips" ] []

        LoginRoute ->
            Url.Builder.relative [ "login" ] []

        ListsRoute ->
            Url.Builder.relative [ "lists" ] []

        JumbotronRoute ->
            Url.Builder.relative [ "jumbotron" ] []

        NotFoundRoute ->
            Url.Builder.relative [ "notfound" ] []


stringToRoute : String -> Route
stringToRoute str =
    case String.toLower str of
        "/accordions" ->
            AccordionsRoute

        "/buttons" ->
            ButtonsRoute

        "/colors" ->
            ColorsRoute

        "/form" ->
            FormRoute

        "/lists" ->
            ListsRoute

        "/messages" ->
            MessagesRoute

        "/tooltips" ->
            TooltipsRoute

        "/typography" ->
            TypographyRoute

        "/jumbotron" ->
            JumbotronRoute

        _ ->
            NotFoundRoute


routeToUrl : Route -> String
routeToUrl route =
    case route of
        AccordionsRoute ->
            "/accordions"

        ButtonsRoute ->
            "/buttons"

        ColorsRoute ->
            "/colors"

        FormRoute ->
            "/form"

        LoginRoute ->
            "/login"

        LoaderRoute ->
            "/loader"

        MessagesRoute ->
            "/messages"

        ListsRoute ->
            "/lists"

        HomeRoute ->
            "/"

        TooltipsRoute ->
            "/tooltips"

        TypographyRoute ->
            "/typography"

        JumbotronRoute ->
            "/jumbotron"

        NotFoundRoute ->
            "/"

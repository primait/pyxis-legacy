module Pyxis.Model.Route exposing (Route(..), routeToLabel)


type Route
    = Welcome
    | GetStarted
    | Style
    | Content
    | Patterns
    | Components
    | Tools


routeToLabel : Route -> String
routeToLabel route =
    case route of
        Welcome ->
            "Welcome"

        GetStarted ->
            "Start using Pyxis"

        Style ->
            "Style"

        Content ->
            "Content"

        Patterns ->
            "Patterns"

        Components ->
            "Components"

        Tools ->
            "Tools and Resources"

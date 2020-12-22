module Pyxis.Model.Route exposing (Route(..), routeToLabel, routeToSlug)


type Route
    = Welcome
    | GetStarted
    | Style
    | Content
    | Patterns
    | Components
    | Tools
    | Logo
    | Typography
    | Color
    | Illustration
    | Iconography


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

        Logo ->
            "Logo"

        Typography ->
            "Typography"

        Color ->
            "Color"

        Illustration ->
            "Illustration"

        Iconography ->
            "Iconography"


routeToSlug : Route -> String
routeToSlug =
    routeToLabel
        >> String.toLower
        >> String.split " "
        >> String.join "_"
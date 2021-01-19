module Pyxis.Route exposing
    ( Route(..)
    , eq
    , parser
    , routeFromUrl
    , routeToLabel
    , routeToPieces
    , routeToSlug
    , routeToString
    )

import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s)


type Route
    = BorderRadius
    | Actions
    | Button
    | Colors
    | Components
    | Containers
    | Content
    | ElevationAndShadows
    | Fonts
    | GetStarted
    | GrammarAndMechanics
    | Iconography
    | Icons
    | Illustration
    | Logo
    | Patterns
    | Style
    | Tools
    | Typography
    | UIKits
    | VoiceAndTone
    | Welcome


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map BorderRadius (s "patterns" </> s "border-radius")
        , Parser.map Colors (s "style" </> s "colors")
        , Parser.map Components (s "components")
        , Parser.map Containers (s "patterns" </> s "containers")
        , Parser.map Content (s "content")
        , Parser.map ElevationAndShadows (s "patterns" </> s "elevation-and-shadows")
        , Parser.map Fonts (s "tools-and-resources" </> s "fonts")
        , Parser.map GetStarted (s "get-started")
        , Parser.map GrammarAndMechanics (s "content" </> s "grammar-and-mechanics")
        , Parser.map Iconography (s "style" </> s "iconography")
        , Parser.map Icons (s "tools-and-resources" </> s "icons")
        , Parser.map Illustration (s "style" </> s "illustration")
        , Parser.map Logo (s "style" </> s "logo")
        , Parser.map Patterns (s "patterns")
        , Parser.map Style (s "style")
        , Parser.map Tools (s "tools-and-resources")
        , Parser.map Typography (s "style" </> s "typography")
        , Parser.map UIKits (s "tools-and-resources" </> s "ui-kits")
        , Parser.map VoiceAndTone (s "content" </> s "voice-and-tone")
        , Parser.map Welcome Parser.top
        ]


routeFromUrl : Url -> Maybe Route
routeFromUrl url =
    -- The RealWorld spec treats the fragment like a path.
    -- This makes it *literally* the path, so we can proceed
    -- with parsing as if it had been a normal path all along.
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse parser


routeToString : Route -> String
routeToString page =
    "#/" ++ String.join "/" (routeToPieces page)


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Actions ->
            [ "components", "actions" ]

        BorderRadius ->
            [ "patterns", "border-radius" ]

        Button ->
            [ "components", "actions", "button" ]

        Colors ->
            [ "style", "colors" ]

        Components ->
            [ "components" ]

        Containers ->
            [ "patterns", "containers" ]

        Content ->
            [ "content" ]

        ElevationAndShadows ->
            [ "patterns", "elevation-and-shadows" ]

        Fonts ->
            [ "tools-and-resources", "fonts" ]

        GetStarted ->
            []

        GrammarAndMechanics ->
            [ "content", "grammar-and-mechanics" ]

        Iconography ->
            [ "style", "iconography" ]

        Icons ->
            [ "tools-and-resources", "icons" ]

        Illustration ->
            [ "style", "illustration" ]

        Logo ->
            [ "style", "logo" ]

        Patterns ->
            [ "patterns" ]

        Style ->
            [ "login" ]

        Tools ->
            [ "tools-and-resources" ]

        Typography ->
            [ "style", "typography" ]

        UIKits ->
            [ "tools-and-resources", "ui-kits" ]

        VoiceAndTone ->
            [ "content", "voice-and-tone" ]

        Welcome ->
            []


routeToLabel : Route -> String
routeToLabel route =
    case route of
        Actions ->
            "Actions"

        BorderRadius ->
            "Border Radius"

        Button ->
            "Button"

        Colors ->
            "Colors"

        Components ->
            "Components"

        Containers ->
            "Containers"

        Content ->
            "Content"

        ElevationAndShadows ->
            "Elevation and Shadows"

        Fonts ->
            "Fonts"

        GetStarted ->
            "Start using Pyxis"

        GrammarAndMechanics ->
            "Grammar and Mechanics"

        Iconography ->
            "Iconography"

        Icons ->
            "Icons"

        Illustration ->
            "Illustration"

        Logo ->
            "Logo"

        Patterns ->
            "Patterns"

        Style ->
            "Style"

        Tools ->
            "Tools and Resources"

        Typography ->
            "Typography"

        UIKits ->
            "UI Kits"

        VoiceAndTone ->
            "Voice and Tone"

        Welcome ->
            "Welcome"


routeToSlug : Route -> String
routeToSlug =
    routeToLabel
        >> String.toLower
        >> String.split " "
        >> String.join "_"


eq : Route -> Route -> Bool
eq a b =
    routeToSlug a == routeToSlug b

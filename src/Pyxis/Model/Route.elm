module Pyxis.Model.Route exposing
    ( Route(..)
    , eq
    , parser
    , routeFromUrl
    , routeToLabel
    , routeToPieces
    , routeToSlug
    , routeToString
    )

import Browser.Navigation as Nav
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)


type Route
    = BorderRadius
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
        Welcome ->
            []

        GetStarted ->
            []

        Style ->
            [ "login" ]

        Colors ->
            [ "style", "colors" ]

        Typography ->
            [ "style", "typography" ]

        Logo ->
            [ "style", "logo" ]

        Illustration ->
            [ "style", "illustration" ]

        Iconography ->
            [ "style", "iconography" ]

        BorderRadius ->
            [ "patterns", "border-radius" ]

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

        GrammarAndMechanics ->
            [ "content", "grammar-and-mechanics" ]

        Icons ->
            [ "tools-and-resources", "icons" ]

        Patterns ->
            [ "patterns" ]

        Tools ->
            [ "tools-and-resources" ]

        UIKits ->
            [ "tools-and-resources", "ui-kits" ]

        VoiceAndTone ->
            [ "content", "voice-and-tone" ]


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

        Colors ->
            "Colors"

        Illustration ->
            "Illustration"

        Iconography ->
            "Iconography"

        BorderRadius ->
            "Border Radius"

        Containers ->
            "Containers"

        ElevationAndShadows ->
            "Elevation and Shadows"

        Fonts ->
            "Fonts"

        GrammarAndMechanics ->
            "Grammar and Mechanics"

        Icons ->
            "Icons"

        UIKits ->
            "UI Kits"

        VoiceAndTone ->
            "Voice and Tone"


routeToSlug : Route -> String
routeToSlug =
    routeToLabel
        >> String.toLower
        >> String.split " "
        >> String.join "_"


eq : Route -> Route -> Bool
eq a b =
    routeToSlug a == routeToSlug b

module Route exposing
    ( ComponentRoute(..)
    , Route(..)
    , fromUrl
    , href
    , pushUrl
    )

import Browser.Navigation as Nav
import Html
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser exposing ((</>), Parser, map, oneOf, parse, s)


type Route
    = Homepage
    | StartUsing
      {-
         Style
      -}
    | Logo
    | Typography
    | Color
    | Illustration
    | Iconography
      {-
         Content
      -}
    | VoiceAndTone
    | GrammarAndMechanics
      {-
         Patterns
      -}
    | ElevationAndShadows
    | BorderRadius
    | Container
      {-
         Components
      -}
    | Component ComponentRoute
      {-
         Tools and Resources
      -}
    | UIKit
    | Fonts
    | Icons
      {-
         Others
      -}
    | NotFound


href : Route -> Html.Attribute msg
href route =
    Attr.href (routeToString route)


pushUrl : Nav.Key -> String -> Route -> Cmd msg
pushUrl key language route =
    Nav.pushUrl key (routeToString route ++ "?lang=" ++ language)


fromUrl : Url -> Route
fromUrl url =
    url
        |> Url.Parser.parse parser
        |> Maybe.withDefault NotFound



-- PRIVATE HELPERS


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Url.Parser.map Homepage Url.Parser.top
        , Url.Parser.map StartUsing (s "start-using")

        -- Style
        , Url.Parser.map Logo (s "logo")
        , Url.Parser.map Typography (s "typography")
        , Url.Parser.map Color (s "color")
        , Url.Parser.map Illustration (s "illustration")
        , Url.Parser.map Iconography (s "iconography")

        -- Content
        , Url.Parser.map VoiceAndTone (s "voice-and-tone")
        , Url.Parser.map GrammarAndMechanics (s "grammar-and-mechanics")

        -- Patterns
        , Url.Parser.map ElevationAndShadows (s "elevation-and-shadows")
        , Url.Parser.map BorderRadius (s "border-radius")
        , Url.Parser.map Container (s "containers")

        -- Components
        , Url.Parser.map Component (s "component" </> oneOf componentRoutes)

        -- Tools and Resources
        , Url.Parser.map UIKit (s "ui-kits")
        , Url.Parser.map Fonts (s "fonts")
        , Url.Parser.map Icons (s "icons")
        ]


routeToString : Route -> String
routeToString route =
    "/" ++ String.join "/" (routeToPieces route)


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Homepage ->
            []

        StartUsing ->
            [ "start-using" ]

        -- Style
        Logo ->
            [ "logo" ]

        Typography ->
            [ "typography" ]

        Color ->
            [ "color" ]

        Illustration ->
            [ "illustration" ]

        Iconography ->
            [ "iconography" ]

        --Content
        VoiceAndTone ->
            [ "voice-and-tone" ]

        GrammarAndMechanics ->
            [ "grammar-and-mechanics" ]

        --Patterns
        ElevationAndShadows ->
            [ "elevation-and-shadows" ]

        BorderRadius ->
            [ "border-radius" ]

        Container ->
            [ "containers" ]

        -- Components
        Component component ->
            [ "component", componentToUrl component ]

        -- Tools and Resources
        UIKit ->
            [ "ui-kits" ]

        Fonts ->
            [ "fonts" ]

        Icons ->
            [ "icons" ]

        -- Others
        NotFound ->
            [ "404" ]



-- Components' routes


type ComponentRoute
    = Accordion
    | AtrTable
    | Badge
    | Button
    | Form
    | Link
    | ListChooser
    | Loader
    | Message
    | Modal
    | Table
    | Tooltip


componentRoutes : List (Parser (ComponentRoute -> a) a)
componentRoutes =
    [ Url.Parser.map Accordion (s "accordion")
    , Url.Parser.map AtrTable (s "atr-table")
    , Url.Parser.map Badge (s "badge")
    , Url.Parser.map Button (s "button")
    , Url.Parser.map Form (s "form")
    , Url.Parser.map Link (s "link")
    , Url.Parser.map ListChooser (s "list-chooser")
    , Url.Parser.map Loader (s "loader")
    , Url.Parser.map Message (s "message")
    , Url.Parser.map Modal (s "modal")
    , Url.Parser.map Table (s "table")
    , Url.Parser.map Tooltip (s "tooltip")
    ]


componentToUrl : ComponentRoute -> String
componentToUrl route =
    case route of
        Accordion ->
            "accordion"

        AtrTable ->
            "atr-table"

        Badge ->
            "badge"

        Button ->
            "button"

        Form ->
            "form"

        Link ->
            "link"

        ListChooser ->
            "list-chooser"

        Loader ->
            "loader"

        Message ->
            "message"

        Modal ->
            "modal"

        Table ->
            "table"

        Tooltip ->
            "tooltip"

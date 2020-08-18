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
import Pages.Accordion.Model exposing (Accordion)
import Url exposing (Url)
import Url.Parser exposing ((</>), Parser, map, oneOf, parse, s)


type Route
    = Homepage
    | Component ComponentRoute
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
        , Url.Parser.map Component (s "component" </> oneOf componentRoutes)
        ]


routeToString : Route -> String
routeToString route =
    "/" ++ String.join "/" (routeToPieces route)


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Homepage ->
            []

        Component component ->
            [ "component", componentToUrl component ]

        NotFound ->
            [ "404" ]



-- Components' routes


type ComponentRoute
    = Accordion
    | AtrTable
    | Button
    | Container
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
    , Url.Parser.map Button (s "button")
    , Url.Parser.map Container (s "container")
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

        Button ->
            "button"

        Container ->
            "container"

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

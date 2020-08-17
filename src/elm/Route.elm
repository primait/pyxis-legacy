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
    | Autocomplete
    | Badge
    | Button
    | Checkbox
    | DateField
    | DropdownMenu
    | Jumbotron
    | Link
    | Loader
    | Message
    | NavigationElements
    | PillButton
    | RadioButton
    | Select
    | Tab
    | TextField
    | Tooltip


componentRoutes : List (Parser (ComponentRoute -> a) a)
componentRoutes =
    [ Url.Parser.map Accordion (s "accordion")
    , Url.Parser.map Autocomplete (s "autocomplete")
    , Url.Parser.map Badge (s "badge")
    , Url.Parser.map Button (s "button")
    , Url.Parser.map Checkbox (s "checkbox")
    , Url.Parser.map DateField (s "date-field")
    , Url.Parser.map DropdownMenu (s "dropdown-menu")
    , Url.Parser.map Jumbotron (s "jumbotron")
    , Url.Parser.map Link (s "link")
    , Url.Parser.map Loader (s "loader")
    , Url.Parser.map Message (s "message")
    , Url.Parser.map NavigationElements (s "nav-elements")
    , Url.Parser.map PillButton (s "pill-button")
    , Url.Parser.map RadioButton (s "radio-button")
    , Url.Parser.map Select (s "select")
    , Url.Parser.map Tab (s "tab")
    , Url.Parser.map TextField (s "text-field")
    , Url.Parser.map Tooltip (s "tooltip")
    ]


componentToUrl : ComponentRoute -> String
componentToUrl route =
    case route of
        Accordion ->
            "accordion"

        Autocomplete ->
            "autocomplete"

        Badge ->
            "badge"

        Button ->
            "button"

        Checkbox ->
            "checkbox"

        DateField ->
            "date-field"

        DropdownMenu ->
            "dropdown-menu"

        Jumbotron ->
            "jumbotron"

        Link ->
            "link"

        Loader ->
            "loader"

        Message ->
            "message"

        NavigationElements ->
            "nav-elements"

        PillButton ->
            "pill-button"

        RadioButton ->
            "radio-button"

        Select ->
            "select"

        Tab ->
            "tab"

        TextField ->
            "text-field"

        Tooltip ->
            "tooltip"

module Pyxis.Model
    exposing
        ( AppStatus(..)
        , Flags
        , HtmlSelector
        , HtmlSnippet
        , Menu
        , Message
        , MessageType(..)
        , Model
        , Msg(..)
        , Route(..)
        , initialModel
        , messageTypeToString
        )

import Navigation exposing (Location)
import Pyxis.Components.Buttons.Model as Buttons
import Pyxis.Components.Colors.Model as Colors
import Pyxis.Components.Form.Model as Form
import Pyxis.Components.Header.Model as Header
import Pyxis.Components.Tooltips.Model as Tooltips
import Time exposing (Time)
import Unique exposing (Id, Unique)


type Msg
    = LocationChange Location
    | RouteUpdate Route
      -------------
    | ShowSource HtmlSnippet
    | HideSource
    | AddMessage Message
    | RemoveMessage (Unique Id)
    | Copied
      -------------
    | ButtonsMsg Buttons.Msg
    | ColorsMsg Colors.Msg
    | FormMsg Form.Msg
    | HeaderMsg Header.Msg
    | TooltipsMsg Tooltips.Msg


type alias Model =
    { status : AppStatus
    , route : Route
    , menu : List Menu
    , messages : List Message
    , htmlSnippet : Maybe HtmlSnippet
    , colors : Colors.Model
    , buttons : Buttons.Model
    , form : Form.Model
    , header : Header.Model
    , tooltips : Tooltips.Model
    }


initialModel : Model
initialModel =
    Model
        AppReady
        HomeRoute
        initialMenu
        []
        Nothing
        Colors.initialModel
        Buttons.initialModel
        Form.initialModel
        Header.initialModel
        Tooltips.initialModel


initialMenu : List Menu
initialMenu =
    [ Menu "home" "Pyxis" HomeRoute True
    , Menu "colors" "Colors" ColorsRoute False
    , Menu "typography" "Typography" TypographyRoute False
    , Menu "buttons" "Buttons" ButtonsRoute False
    , Menu "form" "Form" FormRoute False
    , Menu "header" "Header" HeaderRoute False
    , Menu "footer" "Footer" FooterRoute False
    , Menu "tooltips" "Tooltips" TooltipsRoute False
    ]


type AppStatus
    = AppReady


type Route
    = HomeRoute
      --------------
    | ButtonsRoute
    | ColorsRoute
    | FooterRoute
    | FormRoute
    | HeaderRoute
    | TypographyRoute
    | TooltipsRoute
      --------------
    | NotFoundRoute


type alias Menu =
    { slug : String
    , label : String
    , route : Route
    , isActive : Bool
    }


type alias Message =
    { uuid : Unique Id
    , type_ : MessageType
    , description : String
    , duration : Time
    }


type MessageType
    = Default
    | Error


messageTypeToString : MessageType -> String
messageTypeToString type_ =
    case type_ of
        Default ->
            "default"

        Error ->
            "error"


type alias Flags =
    { route : String
    }


type alias HtmlSelector =
    String


type alias HtmlSnippet =
    String

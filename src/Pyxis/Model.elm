module Pyxis.Model
    exposing
        ( AppMessage
        , AppMessageType(..)
        , AppStatus(..)
        , Flags
        , HtmlSelector
        , HtmlSnippet
        , Menu
        , Model
        , Msg(..)
        , Route(..)
        , appMessageTypeToString
        , initialModel
        )

import Navigation exposing (Location)
import Pyxis.Components.Buttons.Model as Buttons
import Pyxis.Components.Colors.Model as Colors
import Pyxis.Components.Footer.Model as Footer
import Pyxis.Components.Form.Model as Form
import Pyxis.Components.Header.Model as Header
import Pyxis.Components.Messages.Model as Messages
import Pyxis.Components.Tooltips.Model as Tooltips
import Time exposing (Time)
import Unique exposing (Id, Unique)


type Msg
    = LocationChange Location
    | RouteUpdate Route
      -------------
    | ShowSource HtmlSnippet
    | HideSource
    | AddAppMessage AppMessage
    | RemoveAppMessage (Unique Id)
    | Copied
      -------------
    | ButtonsMsg Buttons.Msg
    | ColorsMsg Colors.Msg
    | FormMsg Form.Msg
    | HeaderMsg Header.Msg
    | FooterMsg Footer.Msg
    | TooltipsMsg Tooltips.Msg
    | MessagesMsg Messages.Msg


type alias Model =
    { status : AppStatus
    , route : Route
    , menu : List Menu
    , appMessages : List AppMessage
    , htmlSnippet : Maybe HtmlSnippet
    , colors : Colors.Model
    , buttons : Buttons.Model
    , form : Form.Model
    , header : Header.Model
    , footer : Footer.Model
    , tooltips : Tooltips.Model
    , messages : Messages.Model
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
        Footer.initialModel
        Tooltips.initialModel
        Messages.initialModel


initialMenu : List Menu
initialMenu =
    [ Menu "home" "Pyxis" HomeRoute True
    , Menu "colors" "Colors" ColorsRoute False
    , Menu "typography" "Typography" TypographyRoute False
    , Menu "buttons" "Buttons" ButtonsRoute False
    , Menu "form" "Form" FormRoute False
    -- , Menu "header" "Header" HeaderRoute False
    , Menu "messages" "Messages" MessagesRoute False
    -- , Menu "footer" "Footer" FooterRoute False
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
    | MessagesRoute
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


type alias AppMessage =
    { uuid : Unique Id
    , type_ : AppMessageType
    , description : String
    , duration : Time
    }


type AppMessageType
    = Default
    | Error


appMessageTypeToString : AppMessageType -> String
appMessageTypeToString type_ =
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

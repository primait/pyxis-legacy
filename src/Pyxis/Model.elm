module Pyxis.Model exposing
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
import Pyxis.Components.Accordions.Model as Accordions
import Pyxis.Components.Buttons.Model as Buttons
import Pyxis.Components.Colors.Model as Colors
import Pyxis.Components.Containers.Model as Containers
import Pyxis.Components.Footer.Model as Footer
import Pyxis.Components.Form.Model as Form
import Pyxis.Components.Header.Model as Header
import Pyxis.Components.Lists.Model as Lists
import Pyxis.Components.Loader.Model as Loader
import Pyxis.Components.Login.Model as Login
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
    | AccordionsMsg Accordions.Msg
    | ButtonsMsg Buttons.Msg
    | ColorsMsg Colors.Msg
    | ContainersMsg Containers.Msg
    | FormMsg Form.Msg
    | HeaderMsg Header.Msg
    | LoaderMsg Loader.Msg
    | FooterMsg Footer.Msg
    | TooltipsMsg Tooltips.Msg
    | MessagesMsg Messages.Msg
    | LoginMsg Login.Msg
    | ListsMsg Lists.Msg


type alias Model =
    { status : AppStatus
    , route : Route
    , menu : List Menu
    , appMessages : List AppMessage
    , htmlSnippet : Maybe HtmlSnippet
    , colors : Colors.Model
    , accordions : Accordions.Model
    , containers : Containers.Model
    , buttons : Buttons.Model
    , form : Form.Model
    , header : Header.Model
    , loader : Loader.Model
    , footer : Footer.Model
    , tooltips : Tooltips.Model
    , messages : Messages.Model
    , login : Login.Model
    , lists : Lists.Model
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
        Containers.initialModel
        Accordions.initialModel
        Buttons.initialModel
        Form.initialModel
        Header.initialModel
        Loader.initialModel
        Footer.initialModel
        Tooltips.initialModel
        Messages.initialModel
        Login.initialModel
        Lists.initialModel


initialMenu : List Menu
initialMenu =
    [ Menu "home" "Pyxis" HomeRoute True
    , Menu "accordions" "Accordions" AccordionsRoute False
    , Menu "buttons" "Buttons" ButtonsRoute False
    , Menu "colors" "Colors" ColorsRoute False
    , Menu "containers" "Containers" ContainersRoute False

    -- , Menu "footer" "Footer" FooterRoute False
    , Menu "form" "Form" FormRoute False
    , Menu "lists" "Lists" ListsRoute False
    , Menu "loader" "Loader" LoaderRoute False
    , Menu "login" "Login" LoginRoute False
    , Menu "messages" "Messages" MessagesRoute False

    -- , Menu "header" "Header" HeaderRoute False
    , Menu "typography" "Typography" TypographyRoute False
    , Menu "tooltips" "Tooltips" TooltipsRoute False
    ]


type AppStatus
    = AppReady


type Route
    = HomeRoute
      --------------
    | AccordionsRoute
    | ButtonsRoute
    | ColorsRoute
    | ContainersRoute
    | FooterRoute
    | FormRoute
    | HeaderRoute
    | ListsRoute
    | MessagesRoute
    | LoaderRoute
    | TypographyRoute
    | TooltipsRoute
    | LoginRoute
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

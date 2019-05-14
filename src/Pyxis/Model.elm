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

import Browser exposing (UrlRequest)
import Browser.Navigation as Nav
import Pyxis.Components.Accordions.Model as Accordions
import Pyxis.Components.Buttons.Model as Buttons
import Pyxis.Components.Colors.Model as Colors
import Pyxis.Components.Footer.Model as Footer
import Pyxis.Components.Form.Model as Form
import Pyxis.Components.Header.Model as Header
import Pyxis.Components.Jumbotron.Model as Jumbotron
import Pyxis.Components.Lists.Model as Lists
import Pyxis.Components.Loader.Model as Loader
import Pyxis.Components.Login.Model as Login
import Pyxis.Components.Messages.Model as Messages
import Pyxis.Components.Tooltips.Model as Tooltips
import Url exposing (Url)


type Msg
    = UrlRequested UrlRequest
    | UrlChanged Url
      -------------
    | ShowSource HtmlSnippet
    | HideSource
    | AddAppMessage AppMessage
    | RemoveAppMessage String
    | Copied
      -------------
    | AccordionsMsg Accordions.Msg
    | ButtonsMsg Buttons.Msg
    | ColorsMsg Colors.Msg
    | FormMsg Form.Msg
    | HeaderMsg Header.Msg
    | JumbotronMsg Jumbotron.Msg
    | LoaderMsg Loader.Msg
    | FooterMsg Footer.Msg
    | TooltipsMsg Tooltips.Msg
    | MessagesMsg Messages.Msg
    | LoginMsg Login.Msg
    | ListsMsg Lists.Msg


type alias Model =
    { key : Nav.Key
    , url : Url
    , route : Route
    , status : AppStatus
    , menu : List Menu
    , appMessages : List AppMessage
    , htmlSnippet : Maybe HtmlSnippet
    , colors : Colors.Model
    , accordions : Accordions.Model
    , buttons : Buttons.Model
    , form : Form.Model
    , header : Header.Model
    , jumbotron : Jumbotron.Model
    , loader : Loader.Model
    , footer : Footer.Model
    , tooltips : Tooltips.Model
    , messages : Messages.Model
    , login : Login.Model
    , lists : Lists.Model
    }


initialModel : Url -> Nav.Key -> Model
initialModel url key =
    Model
        key
        url
        HomeRoute
        AppReady
        initialMenu
        []
        Nothing
        Colors.initialModel
        Accordions.initialModel
        Buttons.initialModel
        Form.initialModel
        Header.initialModel
        Jumbotron.initialModel
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
    , Menu "jumbotron" "Jumbotron" JumbotronRoute False
    , Menu "colors" "Colors" ColorsRoute False

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
    | FooterRoute
    | FormRoute
    | HeaderRoute
    | JumbotronRoute
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
    { uuid : String
    , type_ : AppMessageType
    , description : String
    , duration : Float
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
    { host : String
    , protocol : String
    , path : String
    }


type alias HtmlSelector =
    String


type alias HtmlSnippet =
    String

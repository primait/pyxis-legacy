module Pyxis.Model
    exposing
        ( AppStatus(..)
        , Flags
        , HtmlSelector
        , HtmlSnippet
        , Menu
        , Model
        , Msg(..)
        , Route(..)
        , initialModel
        )

import Navigation exposing (Location)
import Pyxis.Components.Colors.Model as Colors
import Pyxis.Components.Form.Model as Form


type Msg
    = LocationChange Location
    | RouteUpdate Route
      -------------
    | ShowSource HtmlSnippet
    | HideSource
      -------------
    | ColorsMsg Colors.Msg
    | FormMsg Form.Msg


type alias Model =
    { status : AppStatus
    , route : Route
    , menu : List Menu
    , htmlSnippet : Maybe HtmlSnippet
    , colors : Colors.Model
    , form : Form.Model
    }


initialModel : Model
initialModel =
    Model
        AppReady
        HomeRoute
        initialMenu
        Nothing
        Colors.initialModel
        Form.initialModel


initialMenu : List Menu
initialMenu =
    [ Menu "home" "Pyxis" HomeRoute True
    , Menu "colors" "Colors" ColorsRoute False
    , Menu "typography" "Typography" TypographyRoute False
    , Menu "form" "Form" FormRoute False
    ]


type AppStatus
    = AppReady


type Route
    = HomeRoute
      --------------
    | ColorsRoute
    | TypographyRoute
    | FormRoute
      --------------
    | NotFoundRoute


type alias Menu =
    { slug : String
    , label : String
    , route : Route
    , isActive : Bool
    }


type alias Flags =
    { route : String
    }


type alias HtmlSelector =
    String


type alias HtmlSnippet =
    String

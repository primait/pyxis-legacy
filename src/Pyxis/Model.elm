module Pyxis.Model
    exposing
        ( AppStatus(..)
        , Menu
        , Model
        , Msg(..)
        , Route(..)
        , initialModel
        )

import Navigation exposing (Location)
import Pyxis.Components.Form.Model as Form


type Msg
    = LocationChange Location
    | RouteUpdate Route
    | FormMsg Form.Msg


type alias Model =
    { status : AppStatus
    , route : Route
    , menu : List Menu
    , form : Form.Model
    }


initialModel : Model
initialModel =
    Model
        AppReady
        HomeRoute
        initialMenu
        Form.initialModel


initialMenu : List Menu
initialMenu =
    [ Menu "home" "Pyxis" (RouteUpdate HomeRoute) True
    , Menu "form" "Form" (RouteUpdate FormRoute) False
    ]


type AppStatus
    = AppReady


type Route
    = HomeRoute
    | FormRoute
    | NotFoundRoute


type alias Menu =
    { slug : String
    , label : String
    , action : Msg
    , isActive : Bool
    }

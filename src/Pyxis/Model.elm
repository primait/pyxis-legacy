module Pyxis.Model
    exposing
        ( AppStatus(..)
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
    , form : Form.Model
    }


initialModel : Model
initialModel =
    Model
        AppReady
        HomeRoute
        Form.initialModel


type AppStatus
    = AppReady


type Route
    = HomeRoute
    | FormRoute
    | NotFoundRoute

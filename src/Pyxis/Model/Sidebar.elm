module Pyxis.Model.Sidebar exposing
    ( Model
    , Msg(..)
    , Route(..)
    , RouteDefaultConfig
    , RouteWithChildrenConfig
    , initialModel
    , routeToKey
    )

import Prima.Pyxis.Accordion as Accordion
import Pyxis.Model.Route as Route


type Msg
    = Toggle String Bool
    | OnRouteChange Route.Route


type alias Model =
    { routes : List Route
    }


initialModel : Model
initialModel =
    { routes =
        [ defaultRoute Route.Welcome
        , defaultRoute Route.GetStarted
        , withChildrenRoute Route.Style
            [ Route.Logo
            , Route.Typography
            , Route.Colors
            , Route.Illustration
            , Route.Iconography
            ]
        , withChildrenRoute Route.Content
            [ Route.VoiceAndTone
            , Route.GrammarAndMechanics
            ]
        , withChildrenRoute Route.Patterns
            [ Route.ElevationAndShadows
            , Route.BorderRadius
            , Route.Containers
            ]
        , withChildrenRoute Route.Tools
            [ Route.UIKits
            , Route.Fonts
            , Route.Icons
            ]
        ]
    }


type Route
    = Default RouteDefaultConfig
    | WithChildren RouteWithChildrenConfig


type alias RouteDefaultConfig =
    { key : Route.Route
    }


type alias RouteWithChildrenConfig =
    { key : Route.Route
    , children : List Route.Route
    , accordionState : Accordion.State
    }


defaultRoute : Route.Route -> Route
defaultRoute route =
    Default { key = route }


withChildrenRoute : Route.Route -> List Route.Route -> Route
withChildrenRoute route children =
    WithChildren
        { key = route
        , children = children
        , accordionState = Accordion.state False
        }


routeToKey : Route -> Route.Route
routeToKey route =
    case route of
        Default { key } ->
            key

        WithChildren { key } ->
            key

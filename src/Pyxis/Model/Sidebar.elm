module Pyxis.Model.Sidebar exposing (Model, Msg(..), Route(..), RouteDefaultConfig, RouteWithChildrenConfig, initialModel, update)

import Prima.Pyxis.Accordion as Accordion
import Pyxis.Model.Route as Route
import Pyxis.Update.Helpers as UH


type Msg
    = Toggle String Bool


type alias Model =
    { routes : List Route
    }


initialModel : Model
initialModel =
    { routes =
        [ defaultRoute Route.Welcome
        , withChildrenRoute Route.Style
            [ Route.Logo
            , Route.Typography
            , Route.Color
            , Route.Illustration
            , Route.Iconography
            ]
        , withChildrenRoute Route.Welcome
            [ Route.Logo
            , Route.Typography
            , Route.Color
            , Route.Illustration
            , Route.Iconography
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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle slug isOpen ->
            model
                |> updateRoute (recalcRouteAccordionState slug isOpen)
                |> UH.withoutCmds


updateRoute : (Route -> Route) -> Model -> Model
updateRoute mapper model =
    { model
        | routes = List.map mapper model.routes
    }


recalcRouteAccordionState : String -> Bool -> Route -> Route
recalcRouteAccordionState slug isOpen route =
    case ( slug == Route.routeToSlug (routeToKey route), isOpen ) of
        ( True, False ) ->
            updateRouteAccordionState Accordion.open route

        ( _, _ ) ->
            updateRouteAccordionState Accordion.close route


updateRouteAccordionState : Accordion.State -> Route -> Route
updateRouteAccordionState state route =
    case route of
        Default _ ->
            route

        WithChildren config ->
            WithChildren { config | accordionState = state }

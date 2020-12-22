module Pyxis.Update.Sidebar exposing (..)

import Prima.Pyxis.Accordion as Accordion
import Pyxis.Model.Route as Route
import Pyxis.Model.Sidebar as Sidebar
import Pyxis.Update.Helpers as UH


update : Sidebar.Msg -> Sidebar.Model -> ( Sidebar.Model, Cmd Sidebar.Msg, Maybe Route.Route )
update msg model =
    case msg of
        Sidebar.Toggle slug isOpen ->
            model
                |> updateRoutes (updateRoute slug isOpen)
                |> UH.withoutCmds
                |> UH.withoutRouteChange

        Sidebar.OnRouteChange route ->
            model
                |> UH.withoutCmds
                |> UH.withRouteChange route


updateRoutes : (Sidebar.Route -> Sidebar.Route) -> Sidebar.Model -> Sidebar.Model
updateRoutes mapper model =
    { model | routes = List.map mapper model.routes }


updateRoute : String -> Bool -> Sidebar.Route -> Sidebar.Route
updateRoute slug isOpen route =
    case ( slug == Route.routeToSlug (Sidebar.routeToKey route), isOpen ) of
        ( True, False ) ->
            updateRouteAccordionState Accordion.open route

        ( _, _ ) ->
            updateRouteAccordionState Accordion.close route


updateRouteAccordionState : Accordion.State -> Sidebar.Route -> Sidebar.Route
updateRouteAccordionState state route =
    case route of
        Sidebar.Default _ ->
            route

        Sidebar.WithChildren config ->
            Sidebar.WithChildren { config | accordionState = state }

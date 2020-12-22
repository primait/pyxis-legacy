module Pyxis.View.Sidebar exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Prima.Pyxis.Accordion as Accordion
import Pyxis.Model.Route as Route
import Pyxis.Model.Sidebar as Sidebar


view : Sidebar.Model -> Html Sidebar.Msg
view model =
    aside
        [ class "pyxis__sidebar" ]
        (List.map renderRoute model.routes)


renderRoute : Sidebar.Route -> Html Sidebar.Msg
renderRoute route =
    case route of
        Sidebar.Default { key } ->
            a
                [ class "pyxis__sidebar__item"
                ]
                [ renderLink key
                ]

        Sidebar.WithChildren { key, children, accordionState } ->
            Sidebar.Toggle
                |> Accordion.light (Route.routeToSlug key)
                |> Accordion.withSimpleTitle (Route.routeToLabel key)
                |> Accordion.withContent [ renderChildren children ]
                |> Accordion.render accordionState


renderChildren : List Route.Route -> Html Sidebar.Msg
renderChildren children =
    ul
        [ class "pyxis__sidebar__list" ]
        (List.map (\child -> li [ class "pyxis__sidebar__list__item" ] [ renderLink child ]) children)


renderLink : Route.Route -> Html Sidebar.Msg
renderLink route =
    a
        [ class "pyxis__sidebar__list__item__link"
        , href "#"
        , onClick <| Sidebar.OnRouteChange route
        ]
        [ (Route.routeToLabel >> text) route
        ]

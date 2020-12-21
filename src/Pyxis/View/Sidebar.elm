module Pyxis.View.Sidebar exposing (view)

import Html exposing (..)
import Html.Attributes exposing (classList, href)
import Html.Events exposing (onClick)
import Prima.Pyxis.Accordion as Accordion
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Model.Route as Route


view : Model -> Html Msg
view model =
    aside
        []
        [ ul
            []
            (List.map
                (routeHierarchyToElement model.route)
                Route.initialRouteHierarchy
            )
        ]


routeHierarchyToElement : Route.Route -> Route.RouteHierarchy -> Html Msg
routeHierarchyToElement currentRoute { parent, children } =
    li
        [ classList
            [ ( "is-active", currentRoute == parent )
            ]
        ]
        [ a
            [ onClick <| OnRouteChange parent
            , href "#"
            ]
            [ parent
                |> Route.routeToLabel
                |> text
            ]
        , ul [] (List.map (routeToElement currentRoute) children)
        ]


routeToElement : Route.Route -> Route.Route -> Html Msg
routeToElement currentRoute route =
    li
        [ classList
            [ ( "is-active", currentRoute == route )
            ]
        ]
        [ a
            [ onClick <| OnRouteChange route, href "#" ]
            [ route
                |> Route.routeToLabel
                |> text
            ]
        ]

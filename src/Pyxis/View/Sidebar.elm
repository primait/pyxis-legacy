module Pyxis.View.Sidebar exposing (view)

import Html exposing (..)
import Html.Attributes exposing (classList)
import Html.Events exposing (onClick)
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Model.Route as Route


view : Model -> Html Msg
view model =
    aside
        []
        [ ul
            []
            ([ Route.Welcome
             , Route.GetStarted
             , Route.Components
             ]
                |> List.map (routeToElement model.route)
            )
        ]


routeToElement : Route.Route -> Route.Route -> Html Msg
routeToElement currentRoute route =
    li
        [ classList
            [ ( "is-active", currentRoute == route )
            ]
        , onClick <| OnRouteChange route
        ]
        [ route
            |> Route.routeToLabel
            |> text
        ]



-- routeToElement : Route.Route -> Html Msg
-- routeToElement route =
--     li
--         []
--         [ (Route.routeToLabel >> text) route
--         ]

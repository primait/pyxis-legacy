module Pyxis.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, button, input, text)
import Html.Events exposing (onClick, onInput)
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Model.Route as Route
import Pyxis.View.Pages.Components as Components
import Pyxis.View.Pages.GetStarted as GetStarted
import Pyxis.View.Pages.Welcome as Welcome
import Pyxis.View.Sidebar as Sidebar


view : Model -> Document Msg
view model =
    { title = "Pyxis by Prima Assicurazioni"
    , body = body model
    }


body : Model -> List (Html Msg)
body model =
    [ Sidebar.view model
    , currentPage model.route
    ]


currentPage : Route.Route -> Html Msg
currentPage route =
    case route of
        Route.Welcome ->
            Welcome.view

        Route.GetStarted ->
            GetStarted.view

        Route.Components ->
            Components.view

        _ ->
            text ""

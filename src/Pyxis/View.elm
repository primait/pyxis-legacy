module Pyxis.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, button, input, text)
import Html.Events exposing (onClick, onInput)
import Pyxis.Helpers as Helpers
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Model.Route as Route
import Pyxis.View.Pages.Components as Components
import Pyxis.View.Pages.Content as Content
import Pyxis.View.Pages.GetStarted as GetStarted
import Pyxis.View.Pages.Patterns as Patterns
import Pyxis.View.Pages.Style as Style
import Pyxis.View.Pages.Tools as Tools
import Pyxis.View.Pages.Welcome as Welcome
import Pyxis.View.Sidebar as Sidebar


view : Model -> Document Msg
view model =
    { title = "Pyxis by Prima Assicurazioni"
    , body = body model
    }


body : Model -> List (Html Msg)
body model =
    [ Helpers.pyxisStyle
    , Sidebar.view model
    , currentPage model.route
    ]


currentPage : Route.Route -> Html Msg
currentPage route =
    case route of
        Route.Welcome ->
            Welcome.view

        Route.GetStarted ->
            GetStarted.view

        Route.Style ->
            Style.view

        Route.Content ->
            Content.view

        Route.Patterns ->
            Patterns.view

        Route.Components ->
            Components.view

        Route.Tools ->
            Tools.view

        Route.Typography ->
            text "Typography"

        _ ->
            text "404 :("

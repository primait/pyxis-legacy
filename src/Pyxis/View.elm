module Pyxis.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, button, div, input, main_, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick, onInput)
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Model.Route as Route exposing (Route(..))
import Pyxis.Pages.Components as Components
import Pyxis.Pages.Content as Content
import Pyxis.Pages.GetStarted as GetStarted
import Pyxis.Pages.Logo as Logo
import Pyxis.Pages.Patterns as Patterns
import Pyxis.Pages.Style as Style
import Pyxis.Pages.Tools as Tools
import Pyxis.Pages.Typography as Typography
import Pyxis.Sidebar as Sidebar exposing (Sidebar)
import Pyxis.View.Pages.Style.Colors as Colors
import Pyxis.View.Pages.Welcome as Welcome


view : Model -> Document Msg
view model =
    { title = "Pyxis by Prima Assicurazioni"
    , body = body model
    }


body : Model -> List (Html Msg)
body model =
    [ main_
        [ class "pyxis"
        ]
        [ Html.map SidebarMsg (Sidebar.view model.sidebar)
        , div [ class "pyxis__content" ] [ currentPage model ]
        ]
    ]


currentPage : Model -> Html Msg
currentPage model =
    case model.route of
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
            Html.map TypographyMsg Typography.view

        Route.Colors ->
            Html.map ColorsMsg (Colors.view model.colorsModel)

        Route.BorderRadius ->
            text "placeholderBorderRadius"

        Route.Containers ->
            text "placeholderContainers"

        Route.ElevationAndShadows ->
            text "placeholderElevationAndShadows"

        Route.Fonts ->
            text "placeholderFonts"

        Route.GrammarAndMechanics ->
            text "placeholderGrammarAndMechanics"

        Route.Iconography ->
            text "placeholderIconography"

        Route.Icons ->
            text "placeholderIcons"

        Route.Illustration ->
            text "placeholderIllustration"

        Route.Logo ->
            Logo.view

        Route.UIKits ->
            text "placeholderUIKits"

        Route.VoiceAndTone ->
            text "placeholderVoiceAndTone"

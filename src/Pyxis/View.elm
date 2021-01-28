module Pyxis.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, div, main_, text)
import Html.Attributes exposing (class)
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Pages.Button as Button
import Pyxis.Pages.Colors as Colors
import Pyxis.Pages.Components as Components
import Pyxis.Pages.Content as Content
import Pyxis.Pages.GetStarted as GetStarted
import Pyxis.Pages.Logo as Logo
import Pyxis.Pages.Patterns as Patterns
import Pyxis.Pages.Style as Style
import Pyxis.Pages.Tools as Tools
import Pyxis.Pages.Typography as Typography
import Pyxis.Pages.Welcome as Welcome
import Pyxis.Route as Route exposing (Route(..))
import Pyxis.Sidebar as Sidebar


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
        , div [ class "content" ] [ currentPage model ]
        ]
    ]


currentPage : Model -> Html Msg
currentPage model =
    case model.route of
        Route.Actions ->
            text "placeholderActions"

        Route.BorderRadius ->
            text "placeholderBorderRadius"

        Route.Button ->
            Html.map ButtonMsg (Button.view model.buttonModel)

        Route.Colors ->
            Html.map ColorsMsg (Colors.view model.colorsModel)

        Route.Components ->
            Components.view

        Route.Containers ->
            text "placeholderContainers"

        Route.Content ->
            Content.view

        Route.ElevationAndShadows ->
            text "placeholderElevationAndShadows"

        Route.Fonts ->
            text "placeholderFonts"

        Route.GetStarted ->
            GetStarted.view

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

        Route.Patterns ->
            Patterns.view

        Route.Style ->
            Style.view

        Route.Tools ->
            Tools.view

        Route.Typography ->
            Html.map TypographyMsg Typography.view

        Route.UIKits ->
            text "placeholderUIKits"

        Route.VoiceAndTone ->
            text "placeholderVoiceAndTone"

        Route.Welcome ->
            Welcome.view

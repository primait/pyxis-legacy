module Pyxis.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, div, main_, text)
import Html.Attributes exposing (class)
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Page.Button as Button
import Pyxis.Page.Colors as Colors
import Pyxis.Page.Components as Components
import Pyxis.Page.Content as Content
import Pyxis.Page.GetStarted as GetStarted
import Pyxis.Page.Logo as Logo
import Pyxis.Page.Patterns as Patterns
import Pyxis.Page.Style as Style
import Pyxis.Page.Tools as Tools
import Pyxis.Page.Typography as Typography
import Pyxis.Page.Welcome as Welcome
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

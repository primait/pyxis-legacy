module Pyxis.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Components.Buttons.View as ButtonsComponent
import Pyxis.Components.Colors.View as ColorsComponent
import Pyxis.Components.Form.View as FormComponent
import Pyxis.Components.Typography.View as Typography
import Pyxis.Home.View as Home
import Pyxis.HtmlSnippet.View as HtmlSnippet
import Pyxis.Messages.View as Messages
import Pyxis.Model
    exposing
        ( AppStatus(..)
        , Model
        , Msg(..)
        , Route(..)
        )
import Pyxis.Nav.View as Nav
import Pyxis.ViewHelpers exposing (wrapper)


view : Model -> Html Msg
view model =
    div
        []
        [ Nav.view model
        , dynamicView model
        , HtmlSnippet.view model.htmlSnippet
        , Messages.view model.messages
        ]


dynamicView : Model -> Html Msg
dynamicView ({ route } as model) =
    case route of
        HomeRoute ->
            Home.view model

        ColorsRoute ->
            (wrapper << List.map (Html.map ColorsMsg)) (ColorsComponent.view model.colors)

        TypographyRoute ->
            (wrapper << Typography.view) model

        ButtonsRoute ->
            (wrapper << List.map (Html.map ButtonsMsg)) (ButtonsComponent.view model.buttons)

        ButtonsRoute ->
            List.map (Html.map ButtonsMsg) (ButtonsComponent.view model.buttons)

        ButtonsRoute ->
            List.map (Html.map ButtonsMsg) (ButtonsComponent.view model.buttons)

        FormRoute ->
            (wrapper << List.map (Html.map FormMsg)) (FormComponent.view model.form)

        _ ->
            (wrapper << List.singleton << text) "Route not found"

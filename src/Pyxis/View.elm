module Pyxis.View exposing (view)

import Html exposing (..)
import Pyxis.AppMessages.View as AppMessages
import Pyxis.Components.Buttons.View as ButtonsComponent
import Pyxis.Components.Colors.View as ColorsComponent
import Pyxis.Components.Footer.View as FooterComponent
import Pyxis.Components.Form.View as FormComponent
import Pyxis.Components.Header.View as HeaderComponent
import Pyxis.Components.Login.View as LoginComponent
import Pyxis.Components.Messages.View as MessagesComponent
import Pyxis.Components.Tooltips.View as TooltipsComponent
import Pyxis.Components.Typography.View as Typography
import Pyxis.Home.View as Home
import Pyxis.HtmlSnippet.View as HtmlSnippet
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
        , AppMessages.view model.appMessages
        ]


dynamicView : Model -> Html Msg
dynamicView ({ route } as model) =
    case route of
        ButtonsRoute ->
            (wrapper << List.map (Html.map ButtonsMsg)) (ButtonsComponent.view model.buttons)

        ColorsRoute ->
            (wrapper << List.map (Html.map ColorsMsg)) (ColorsComponent.view model.colors)

        FooterRoute ->
            (div [] << List.map (Html.map FooterMsg)) (FooterComponent.view model.footer)

        FormRoute ->
            (wrapper << List.map (Html.map FormMsg)) (FormComponent.view model.form)

        HeaderRoute ->
            (div [] << List.map (Html.map HeaderMsg)) (HeaderComponent.view model.header)

        MessagesRoute ->
            (wrapper << List.map (Html.map MessagesMsg)) (MessagesComponent.view model.messages)

        HomeRoute ->
            Home.view model

        LoginRoute ->
            (wrapper << List.map (Html.map LoginMsg)) (LoginComponent.view model.login)

        TooltipsRoute ->
            (wrapper << List.map (Html.map TooltipsMsg)) (TooltipsComponent.view model.tooltips)

        TypographyRoute ->
            (wrapper << Typography.view) model

        _ ->
            (wrapper << List.singleton << text) "Route not found"

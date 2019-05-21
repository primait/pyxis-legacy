module Pyxis.Components.View exposing (view)

import Browser
import Html exposing (..)
import Pyxis.Components.Accordions.View as AccordionsComponent
import Pyxis.Components.Buttons.View as ButtonsComponent
import Pyxis.Components.Colors.View as ColorsComponent
import Pyxis.Components.Form.View as FormComponent
import Pyxis.Components.Jumbotron.View as JumbotronComponent
import Pyxis.Components.Lists.View as ListsComponent
import Pyxis.Components.Loader.View as LoaderComponent
import Pyxis.Components.Login.View as LoginComponent
import Pyxis.Components.Messages.View as MessagesComponent
import Pyxis.Components.Table.View as TableComponent
import Pyxis.Components.Tooltips.View as TooltipsComponent
import Pyxis.Components.Typography.View as Typography
import Pyxis.Home.View as Home
import Pyxis.Model
    exposing
        ( AppStatus(..)
        , Model
        , Msg(..)
        , Route(..)
        )
import Pyxis.ViewHelpers exposing (wrapper)


view : Model -> Html Msg
view ({ route } as model) =
    case route of
        AccordionsRoute ->
            (wrapper << List.map (Html.map AccordionsMsg)) (AccordionsComponent.view model.accordions)

        ButtonsRoute ->
            (wrapper << List.map (Html.map ButtonsMsg)) (ButtonsComponent.view model.buttons)

        ColorsRoute ->
            (wrapper << List.map (Html.map ColorsMsg)) (ColorsComponent.view model.colors)

        FormRoute ->
            (wrapper << List.map (Html.map FormMsg)) (FormComponent.view model.form)

        JumbotronRoute ->
            (wrapper << List.map (Html.map JumbotronMsg)) (JumbotronComponent.view model.jumbotron)

        LoaderRoute ->
            (wrapper << List.map (Html.map LoaderMsg)) (LoaderComponent.view model.loader)

        ListsRoute ->
            (wrapper << List.map (Html.map ListsMsg)) (ListsComponent.view model.lists)

        MessagesRoute ->
            (wrapper << List.map (Html.map MessagesMsg)) (MessagesComponent.view model.messages)

        HomeRoute ->
            Home.view model

        LoginRoute ->
            (wrapper << List.map (Html.map LoginMsg)) (LoginComponent.view model.login)

        TableRoute ->
            (wrapper << List.map (Html.map TableMsg)) (TableComponent.view model.table)

        TooltipsRoute ->
            (wrapper << List.map (Html.map TooltipsMsg)) (TooltipsComponent.view model.tooltips)

        TypographyRoute ->
            (wrapper << Typography.view) model

        _ ->
            (wrapper << List.singleton << text) "Route not found"

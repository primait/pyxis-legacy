module Pyxis.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Components.Buttons.View as ButtonsComponent
import Pyxis.Components.Colors.View as ColorsComponent
import Pyxis.Components.Form.View as FormComponent
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


view : Model -> Html Msg
view model =
    div
        [ class "pyWrapper"
        ]
        (Nav.view model :: dynamicView model)


dynamicView : Model -> List (Html Msg)
dynamicView ({ route } as model) =
    (case route of
        HomeRoute ->
            Home.view model

        ColorsRoute ->
            List.map (Html.map ColorsMsg) (ColorsComponent.view model.colors)

        TypographyRoute ->
            Typography.view model

        ButtonsRoute ->
            List.map (Html.map ButtonsMsg) (ButtonsComponent.view model.buttons)

        FormRoute ->
            List.map (Html.map FormMsg) (FormComponent.view model.form)

        _ ->
            (List.singleton << text) "Route not found"
    )
        ++ commonView model


commonView : Model -> List (Html Msg)
commonView { htmlSnippet } =
    [ HtmlSnippet.view htmlSnippet
    ]

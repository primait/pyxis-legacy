module Pyxis.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Components.Colors.View as ColorsComponent
import Pyxis.Components.Form.View as FormComponent
import Pyxis.Home.View as Home
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
        [ class "wrapper"
        ]
        (Nav.view model :: dynamicView model)


dynamicView : Model -> List (Html Msg)
dynamicView ({ route } as model) =
    case route of
        HomeRoute ->
            Home.view model

        ColorsRoute ->
            List.map (Html.map ColorsMsg) (ColorsComponent.view model.colors)

        FormRoute ->
            List.map (Html.map FormMsg) (FormComponent.view model.form)

        _ ->
            [ text "Route not found"
            ]

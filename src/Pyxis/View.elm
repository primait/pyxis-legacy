module Pyxis.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Components.Form.View as FormComponent
import Pyxis.Home.View as HomeComponent
import Pyxis.Model
    exposing
        ( AppStatus(..)
        , Model
        , Msg(..)
        , Route(..)
        )


view : Model -> Html Msg
view ({ route } as model) =
    div
        [ class "wrapper"
        ]
        (case route of
            HomeRoute ->
                [ HomeComponent.view model ]

            FormRoute ->
                List.map (Html.map FormMsg) (FormComponent.view model.form)

            _ ->
                [ text "Route not found"
                ]
        )

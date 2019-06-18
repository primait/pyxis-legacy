module Button.View exposing (view)

import Browser
import Button.Model
    exposing
        ( Btn
        , BtnType(..)
        , Model
        , Msg(..)
        )
import Html exposing (..)
import Html.Attributes exposing (class, id)
import Prima.Pyxis.Button as Button
import Pyxis.Helpers as Helpers


view : Model -> Html Msg
view model =
    div
        []
        [ Helpers.pyxisStyle
        , model.buttons
            |> List.map (\btn -> ( True, btn.config ))
            |> Button.group
            |> List.singleton
            |> Helpers.syntaxWrapper
        ]

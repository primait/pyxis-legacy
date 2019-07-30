module Button.View exposing (view)

import Button.Model
    exposing
        ( Btn
        , BtnType(..)
        , Model
        , Msg(..)
        )
import Html exposing (..)
import Prima.Pyxis.Button as Button
import Pyxis.Helpers as Helpers


view : Model -> Html Msg
view model =
    div
        []
        [ model.buttons
            |> List.map (\btn -> Button.render True btn.config)
            |> Helpers.syntaxWrapper
        ]

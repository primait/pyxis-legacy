module Pyxis.Home.View exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        , Route(..)
        )


view : Model -> Html Msg
view model =
    div
        []
        [ a
            [ onClick (RouteUpdate FormRoute) ]
            [ text "Go to Form" ]
        ]

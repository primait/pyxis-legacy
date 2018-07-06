module Pyxis.Home.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        , Route(..)
        )
import Pyxis.ViewHelpers exposing (wrapper)


view : Model -> Html Msg
view model =
    div
        [ class "pyIntro" ]
        [ wrapper
            [ h1
                [ class "pyTitle" ]
                [ text "Welcome to "
                , span [ class "purple" ] [ text "Pyxis!" ]
                ]
            , h2
                [ class "pySubtitle" ]
                [ text "Prima Assicurazioni Design System" ]
            ]
        ]

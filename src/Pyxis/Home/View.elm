module Pyxis.Home.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        , Route(..)
        )


view : Model -> List (Html Msg)
view model =
    [ h1 [ class "appTitle" ] [ text "Welcome to ", span [ class "purple" ] [ text "Pyxis!" ] ]
    , h2 [ class "sectionTitle" ] [ text "Prima Assicurazioni Design System" ]
    ]

module Achille.View exposing (view)

import Achille.Model exposing (AppStatus(..), Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (class)


view : Model -> Html Msg
view model =
    div
        []
        [ text "Achille is angry"
        ]

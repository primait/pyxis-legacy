module Pyxis.Components.Footer.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers exposing (componentTitle, divider, renderOrNothing)


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Footer" ]
    , divider
    , footer
        [ class "o-footer" ]
        [ text "Footer" ]
    ]

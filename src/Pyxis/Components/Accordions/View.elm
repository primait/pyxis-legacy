module Pyxis.Components.Accordions.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Pyxis.Components.Accordions.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        )


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Accordions" ]
    , divider
    ]

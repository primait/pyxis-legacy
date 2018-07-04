module Pyxis.Components.Typography.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Helpers
    exposing
        ( divider
        , renderOrNothing
        )
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        )


view : Model -> List (Html Msg)
view model =
    [ h2 [ class "sectionTitle" ] [ text "Form components" ]
    , divider
    , h1 [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    , h2 [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    , h3 [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    , h4 [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    , h5 [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    , h6 [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    , p [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    ]

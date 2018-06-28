module Pyxis.Nav.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import Pyxis.Model
    exposing
        ( Menu
        , Model
        , Msg(..)
        )


view : Model -> Html Msg
view { menu } =
    nav
        [ class "nav" ]
        [ ul
            [ class "nav__menu" ]
            (List.map item menu)
        ]


item : Menu -> Html Msg
item { slug, label, action, isActive } =
    li
        [ classList
            [ ( "nav__menu__item", True )
            , ( "is-active", isActive )
            ]
        , onClick action
        ]
        [ text label
        ]

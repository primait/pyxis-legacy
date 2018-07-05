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
        [ class "pyNav" ]
        [ ul
            [ class "pyNav__menu" ]
            (List.map item menu)
        ]


item : Menu -> Html Msg
item { slug, label, route, isActive } =
    li
        [ classList
            [ ( "pyNav__menu__item", True )
            , ( "is-active", isActive )
            ]
        , (onClick << RouteUpdate) route
        ]
        [ text label
        ]

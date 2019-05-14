module Pyxis.Nav.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Html.Events exposing (onClick)
import Pyxis.Helpers as Helpers
import Pyxis.Model
    exposing
        ( Menu
        , Model
        , Msg(..)
        )
import Pyxis.Router as Router


view : Model -> Html Msg
view { menu } =
    nav
        [ class "pyNav" ]
        [ div
            [ class "pyWrapper"
            ]
            [ ul
                [ class "pyNav__menu" ]
                (List.map item menu)
            ]
        ]


item : Menu -> Html Msg
item { slug, label, route, isActive } =
    li
        [ classList
            [ ( "pyNav__menu__item", True )
            , ( "is-active", isActive )
            ]
        ]
        [ a [ (href << Router.routeToString) route ] [ text label ]
        ]

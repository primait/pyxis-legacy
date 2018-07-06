module Pyxis.HtmlSnippet.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import Maybe.Extra exposing (isJust, isNothing)
import Pyxis.Model
    exposing
        ( HtmlSnippet
        , Model
        , Msg(..)
        )
import Pyxis.ViewHelpers exposing (renderOrNothing)


view : Maybe HtmlSnippet -> Html Msg
view html =
    footer
        [ classList
            [ ( "pyFooter", True )
            , ( "is-open", isJust html )
            ]
        ]
        [ div
            [ class "pyWrapper" ]
            [ close
            , (renderOrNothing << Maybe.map snippet) html
            ]
        ]


close : Html Msg
close =
    a
        [ class "pyLink pyFooter__link"
        , onClick HideSource
        ]
        [ text "Close" ]


snippet : String -> Html Msg
snippet html =
    pre
        [ class "pySnippet"
        ]
        [ text html
        ]

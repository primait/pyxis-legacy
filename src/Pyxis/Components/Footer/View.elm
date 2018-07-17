module Pyxis.Components.Footer.View exposing (view)

import Html exposing (..)
import Pyxis.Components.Footer.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers exposing (componentTitle, divider, renderHTMLContent, renderOrNothing)


view : Model -> List (Html Msg)
view { template } =
    [ componentTitle [ text "Footer" ]
    , divider
    ]
        ++ (Maybe.withDefault [] << Maybe.map renderHTMLContent) template

module Pyxis.Components.Header.View exposing (view)

import Html exposing (..)
import Pyxis.Components.Header.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers exposing (componentTitle, divider, renderHTMLContent, renderOrNothing)


view : Model -> List (Html Msg)
view { template } =
    [ componentTitle [ text "Header" ]
    , divider
    ]
        ++ (Maybe.withDefault [] << Maybe.map renderHTMLContent) template

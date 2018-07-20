module Pyxis.Components.Messages.View exposing (view)

import Html exposing (..)
import Pyxis.Components.Messages.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers exposing (componentTitle, divider, renderHTMLContent, renderOrNothing)


view : Model -> List (Html Msg)
view { template } =
    [ componentTitle [ text "Messages" ]
    , divider
    ]
        ++ (Maybe.withDefault [] << Maybe.map renderHTMLContent) template

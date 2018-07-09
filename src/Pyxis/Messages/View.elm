module Pyxis.Messages.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Pyxis.Model
    exposing
        ( Message
        , MessageType(..)
        , Msg(..)
        , messageTypeToString
        )


view : List Message -> Html Msg
view messages =
    div
        [ class "pyMessageList" ]
        [ div
            [ class "pyWrapper"
            ]
            (List.map renderMessage messages)
        ]


renderMessage : Message -> Html Msg
renderMessage { type_, description } =
    div
        [ classList
            [ ( "pyMessage", True )
            , ( messageTypeToString type_, True )
            ]
        ]
        [ text description
        ]

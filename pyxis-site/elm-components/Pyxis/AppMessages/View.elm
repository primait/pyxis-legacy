module Pyxis.AppMessages.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Pyxis.Model
    exposing
        ( AppMessage
        , AppMessageType(..)
        , Msg(..)
        , appMessageTypeToString
        )


view : List AppMessage -> Html Msg
view appMessages =
    div
        [ class "pyMessageList" ]
        [ div
            [ class "pyWrapper"
            ]
            (List.map renderAppMessage appMessages)
        ]


renderAppMessage : AppMessage -> Html Msg
renderAppMessage { type_, description } =
    div
        [ classList
            [ ( "pyMessage", True )
            , ( appMessageTypeToString type_, True )
            ]
        ]
        [ text description
        ]

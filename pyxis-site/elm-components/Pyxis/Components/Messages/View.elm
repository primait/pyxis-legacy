module Pyxis.Components.Messages.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Pyxis.Components.Messages.Model
    exposing
        ( Message
        , Model
        , Msg(..)
        , isMessageTypeDefault
        , isMessageTypeError
        , isMessageTypeSuccess
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        , renderHTMLContent
        , renderOrNothing
        )


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Messages" ]
    , divider
    ]
        ++ List.map
            (\( slug, message ) ->
                (componentShowdown "Message" slug InspectHtml
                    << List.singleton
                    << renderMessage
                )
                    message
            )
            model.messages


renderMessage : Message -> Html Msg
renderMessage { type_, content } =
    div
        [ classList
            [ ( "m-message", True )
            , ( "m-message--success", isMessageTypeSuccess type_ )
            , ( "m-message--error", isMessageTypeError type_ )
            ]
        ]
        [ div
            [ class "m-message__icon" ]
            [ i
                [ classList
                    [ ( "a-icon", True )
                    , ( "a-icon-info", isMessageTypeDefault type_ )
                    , ( "a-icon-ok", isMessageTypeSuccess type_ )
                    , ( "a-icon-attention", isMessageTypeError type_ )
                    ]
                ]
                []
            ]
        , span
            [ class "m-message__text" ]
            (renderHTMLContent content)
        ]

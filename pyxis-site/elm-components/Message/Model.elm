module Message.Model exposing
    ( Flags
    , MessageType(..)
    , Model
    , Msg(..)
    , initialModel
    , messageTypeFromString
    , messageTypeToMapper
    )

import Html exposing (Html)
import Prima.Pyxis.Message as Message


type Msg
    = NoOp


type alias Model =
    { messageList : List (List (Html Msg) -> Message.Config Msg)
    }


type MessageType
    = Info
    | Error
    | Success


messageTypeFromString : String -> Maybe MessageType
messageTypeFromString str =
    case String.toLower str of
        "info" ->
            Just Info

        "error" ->
            Just Error

        "success" ->
            Just Success

        _ ->
            Nothing


messageTypeToMapper : MessageType -> (List (Html Msg) -> Message.Config Msg)
messageTypeToMapper type_ =
    case type_ of
        Info ->
            Message.messageInfoConfig

        Error ->
            Message.messageErrorConfig

        Success ->
            Message.messageSuccessConfig


initialModel : Model
initialModel =
    Model []


type alias Flags =
    { messageType : String
    }

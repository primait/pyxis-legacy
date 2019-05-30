module Message exposing (main)

import Browser
import Message.Model
    exposing
        ( Flags
        , Model
        , Msg
        , initialModel
        , messageTypeFromString
        , messageTypeToMapper
        )
import Message.Update exposing (update)
import Message.View exposing (view)
import Prima.Pyxis.Message as Message


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { initialModel
        | messageList =
            (List.singleton
                << Maybe.withDefault Message.messageInfoConfig
                << Maybe.map messageTypeToMapper
                << messageTypeFromString
            )
                flags.messageType
      }
    , Cmd.none
    )

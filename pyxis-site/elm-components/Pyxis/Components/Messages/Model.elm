module Pyxis.Components.Messages.Model exposing
    ( Message
    , Model
    , Msg(..)
    , initialModel
    , isMessageTypeDefault
    , isMessageTypeError
    , isMessageTypeSuccess
    )

import Http


type Msg
    = InspectHtml String


type alias Model =
    { messages : List ( String, Message )
    }


initialModel : Model
initialModel =
    Model
        [ ( "defaultMessage", Message Default "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." )
        , ( "successMessage", Message Success "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." )
        , ( "errorMessage", Message Error "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." )
        ]


type alias Message =
    { type_ : MessageType
    , content : String
    }


type MessageType
    = Default
    | Success
    | Error


isMessageTypeDefault : MessageType -> Bool
isMessageTypeDefault =
    (==) Default


isMessageTypeSuccess : MessageType -> Bool
isMessageTypeSuccess =
    (==) Success


isMessageTypeError : MessageType -> Bool
isMessageTypeError =
    (==) Error

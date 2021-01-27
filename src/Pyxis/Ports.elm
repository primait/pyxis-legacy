port module Pyxis.Ports exposing (..)


port copyToClipboard : String -> Cmd msg


port copyAcknowledgement : (() -> msg) -> Sub msg


port requestInnerHTML : String -> Cmd msg


port receivedInnerHTML : ({ target : String, innerHTML : String } -> msg) -> Sub msg

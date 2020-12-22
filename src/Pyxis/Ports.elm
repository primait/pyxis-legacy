port module Pyxis.Ports exposing (..)


port copyToClipboard : String -> Cmd msg


port copyAcknowledgement : (() -> msg) -> Sub msg

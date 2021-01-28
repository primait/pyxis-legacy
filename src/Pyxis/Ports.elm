port module Pyxis.Ports exposing (copyAcknowledgement, copyToClipboard)


port copyToClipboard : String -> Cmd msg


port copyAcknowledgement : (() -> msg) -> Sub msg

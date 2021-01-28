port module Pyxis.Pages.Button.Ports exposing (receivedInnerHTML, requestInnerHTML)


port requestInnerHTML : String -> Cmd msg


port receivedInnerHTML : ({ target : String, innerHTML : String } -> msg) -> Sub msg

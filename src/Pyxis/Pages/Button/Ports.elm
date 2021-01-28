port module Pyxis.Pages.Button.Ports exposing (..)


port requestInnerHTML : String -> Cmd msg


port receivedInnerHTML : ({ target : String, innerHTML : String } -> msg) -> Sub msg

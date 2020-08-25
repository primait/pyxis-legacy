module Pages.Message.Model exposing (..)

import Dict
import Pages.Component exposing (WithCodeInspectors)


type Msg
    = NoOp
    | ToggleInspect String Bool


type alias Model =
    WithCodeInspectors {}


init : Model
init =
    { inspectMode = Dict.empty
    }

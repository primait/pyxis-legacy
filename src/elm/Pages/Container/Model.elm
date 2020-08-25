module Pages.Container.Model exposing (..)

import Dict
import Helpers exposing (Translator, WithTranslator)
import Pages.Component exposing (WithCodeInspectors)


type Msg
    = NoOp
    | ToggleInspect String Bool
    | CopyToClipboard String


type alias Model =
    WithCodeInspectors (WithTranslator {})


init : Translator -> Model
init translate =
    { inspectMode = Dict.empty
    , translate = translate
    }

module Pages.Button.Model exposing (Model, Msg(..), init)

import Helpers exposing (Translator)


type Msg
    = NoOp
    | ToggleInspectMode Bool


type alias Model =
    { translate : Translator
    , isInspecting : Bool
    }


init : Translator -> Model
init translate =
    { translate = translate
    , isInspecting = False
    }

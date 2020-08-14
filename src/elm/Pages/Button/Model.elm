module Pages.Button.Model exposing (Model, Msg(..), initialModel)

import Helpers exposing (Translator)


type Msg
    = NoOp
    | ToggleInspectMode Bool


type alias Model =
    { translate : Translator
    , isInspecting : Bool
    }


initialModel : Translator -> Model
initialModel translate =
    { translate = translate
    , isInspecting = False
    }

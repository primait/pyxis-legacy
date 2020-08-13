module Pages.Button.Model exposing (Model, Msg(..), initialModel)

import Helpers exposing (Translator)


type Msg
    = NoOp
    | ToggleInspectMode Bool


type alias Model =
    { t : Translator
    , isInspecting : Bool
    }


initialModel : Translator -> Model
initialModel t =
    { t = t
    , isInspecting = False
    }

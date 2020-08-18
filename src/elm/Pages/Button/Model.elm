module Pages.Button.Model exposing (Model, Msg(..), init, isInspecting)

import Dict exposing (Dict)
import Helpers exposing (Translator)


type Msg
    = NoOp
    | ToggleInspectMode String Bool


type alias Model =
    { translate : Translator
    , isInspecting : Dict String Bool
    }


init : Translator -> Model
init translate =
    { translate = translate
    , isInspecting = Dict.empty
    }


isInspecting : String -> Model -> Bool
isInspecting id model =
    Dict.get id model.isInspecting
        |> Maybe.withDefault False

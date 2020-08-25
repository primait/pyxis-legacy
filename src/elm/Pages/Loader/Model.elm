module Pages.Loader.Model exposing (..)

import Dict
import Helpers exposing (Translator, WithTranslator)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)


type Msg
    = NoOp
    | ToggleInspect String Bool


type alias Model =
    WithCodeInspectors (WithTranslator {})


init : Translator -> Model
init translate =
    { inspectMode = Dict.empty
    , translate = translate
    }


isInspectModeActive : String -> Model -> Bool
isInspectModeActive id model =
    ComponentPage.isInspecting id model

module Pages.Button.Model exposing (Model, Msg(..), init, isInspecting)

import Dict exposing (Dict)
import Helpers exposing (Translator, WithTranslator)
import Pages.Component exposing (WithCodeInspectors)


type Msg
    = NoOp
    | ToggleInspectMode String Bool


type alias Model =
    WithCodeInspectors (WithTranslator {})


init : Translator -> Model
init translate =
    { translate = translate
    , inspectMode = Dict.empty
    }


isInspecting : String -> Model -> Bool
isInspecting id model =
    Dict.get id model.inspectMode
        |> Maybe.withDefault False

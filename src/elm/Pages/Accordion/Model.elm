module Pages.Accordion.Model exposing
    ( AccordionId(..)
    , Model
    , Msg(..)
    , getAccordionState
    , idToString
    , init
    , isInspecting
    )

import Dict exposing (Dict)
import Helpers exposing (Translator)
import Prima.Pyxis.Accordion as Accordion


type Msg
    = NoOp
    | ToggleInspect String Bool
    | ToggleAccordion String Bool


type alias Model =
    { translate : Translator
    , isInspecting : Dict String Bool
    , accordionsState : Dict String Accordion.State
    }


init : Translator -> Model
init translate =
    { translate = translate
    , isInspecting = Dict.empty
    , accordionsState = Dict.empty
    }


getAccordionState : String -> Model -> Accordion.State
getAccordionState id model =
    Dict.get id model.accordionsState
        |> Maybe.withDefault Accordion.close


isInspecting : String -> Model -> Bool
isInspecting id model =
    Dict.get id model.isInspecting
        |> Maybe.withDefault False


type AccordionId
    = Light
    | Base
    | Dark
    | LightGroup Int
    | BaseGroup Int
    | DarkGroup Int


idToString : AccordionId -> String
idToString accordion =
    case accordion of
        Light ->
            "accordion_light"

        Base ->
            "accordion_base"

        Dark ->
            "accordion_dark"

        LightGroup index ->
            "light-group-" ++ String.fromInt index

        BaseGroup index ->
            "base-group-" ++ String.fromInt index

        DarkGroup index ->
            "dark-group" ++ String.fromInt index

module Pages.Form.Model exposing (..)

import Dict exposing (Dict)
import Pages.Component exposing (WithCodeInspectors)
import Set exposing (Set)


type Msg
    = NoOp
    | ToggleInspect String Bool
    | UpdateStringField String String
    | ToggleBoolField String Bool
    | ToggleStringSet String String


type alias Model =
    WithCodeInspectors
        { form : FormData
        }


type alias FormData =
    { strData : Dict String String
    , boolData : Dict String Bool
    , stringSets : Dict String (Set String)
    }


initialFormData : FormData
initialFormData =
    { strData = Dict.empty
    , boolData = Dict.empty
    , stringSets = Dict.empty
    }


init : Model
init =
    { inspectMode = Dict.empty
    , form = initialFormData
    }



-- HELPERS


setFieldValue : String -> String -> Model -> Model
setFieldValue id value model =
    let
        form =
            model.form
    in
    { model | form = { form | strData = Dict.insert id value form.strData } }


setBoolField : String -> Bool -> Model -> Model
setBoolField id value model =
    let
        form =
            model.form
    in
    { model | form = { form | boolData = Dict.insert id value form.boolData } }


toggleCheckboxValue : String -> String -> Model -> Model
toggleCheckboxValue id value model =
    let
        form =
            model.form

        set =
            Dict.get id form.stringSets
                |> Maybe.withDefault Set.empty

        newSet : Set String
        newSet =
            if Set.member value set then
                Set.remove value set

            else
                Set.insert value set
    in
    { model | form = { form | stringSets = Dict.insert id newSet form.stringSets } }

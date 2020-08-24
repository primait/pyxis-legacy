module Pages.AtrTable.Model exposing (Model, Msg(..), init)

import Dict
import Pages.Component exposing (WithCodeInspectors)
import Prima.Pyxis.AtrTable as AtrTable


type Msg
    = NoOp
    | ToggleInspect String Bool
    | UpdateAtrTable AtrTable.Msg


type alias Model =
    WithCodeInspectors
        { atrTable : AtrTable.State
        }


init : Model
init =
    { inspectMode = Dict.empty, atrTable = initTable }


initTable : AtrTable.State
initTable =
    let
        isEditable =
            True
    in
    (Tuple.first << (AtrTable.state isEditable << List.map createAtr)) (List.range 2012 2019)


createAtr : Int -> AtrTable.AtrDetail
createAtr year =
    year
        |> AtrTable.atr
        |> AtrTable.paritaria (Just "1")
        |> AtrTable.paritariaMista (Just "1")
        |> AtrTable.paritariaCose (Just "1")
        |> AtrTable.paritariaPersone (Just "1")
        |> AtrTable.principale (Just "1")
        |> AtrTable.principaleMista (Just "1")
        |> AtrTable.principaleCose (Just "1")
        |> AtrTable.principalePersone (Just "1")

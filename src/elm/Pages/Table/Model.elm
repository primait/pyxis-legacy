module Pages.Table.Model exposing (..)

import Dict exposing (Dict)
import Pages.Component exposing (WithCodeInspectors)
import Prima.Pyxis.Table as PyxisTable


type Msg
    = NoOp
    | ToggleInspect String Bool
    | UpdateTable String PyxisTable.State


type alias Model =
    WithCodeInspectors
        { tableState : Dict String PyxisTable.State
        }


init : Model
init =
    { inspectMode = Dict.empty
    , tableState =
        Dict.fromList
            [ ( "base", initialTableState )
            , ( "light", initialTableState )
            , ( "base-alt", initialTableState )
            , ( "light-alt", initialTableState )
            ]
    }


initialTableState : PyxisTable.State
initialTableState =
    PyxisTable.init Nothing Nothing


getTableState : String -> Model -> PyxisTable.State
getTableState id model =
    Dict.get id model.tableState
        |> Maybe.withDefault initialTableState

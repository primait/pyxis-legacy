module Pages.ListChooser.Model exposing (..)

import Dict
import Pages.Component exposing (WithCodeInspectors)
import Prima.Pyxis.ListChooser as PyxisListChooser


type Msg
    = NoOp
    | ToggleInspect String Bool
    | CopyToClipboard String
    | UpdateSingleSelect PyxisListChooser.Msg
    | UpdateMultiSelect PyxisListChooser.Msg


type alias Model =
    WithCodeInspectors
        { singleSelectList : PyxisListChooser.State
        , multiSelectList : PyxisListChooser.State
        }


init : Model
init =
    { inspectMode = Dict.empty
    , singleSelectList = initialListState
    , multiSelectList = initialListState
    }


initialListState : PyxisListChooser.State
initialListState =
    PyxisListChooser.init PyxisListChooser.Partial
        |> PyxisListChooser.withItems exampleItems


exampleItems : List PyxisListChooser.ChooserItem
exampleItems =
    List.range 1 5
        |> List.map
            (\index ->
                PyxisListChooser.createItem
                    (String.fromInt index)
                    ("Item " ++ String.fromInt index)
                    False
            )


baseConfig : PyxisListChooser.Config
baseConfig =
    PyxisListChooser.config 3 "View All" "View first 3"


multiSelectConfig : PyxisListChooser.Config
multiSelectConfig =
    baseConfig |> PyxisListChooser.withMultipleSelection True

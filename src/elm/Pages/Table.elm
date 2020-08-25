module Pages.Table exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)
import Pages.Table.Model as M exposing (Model, Msg(..))
import Prima.Pyxis.Table as PyxisTable


view : Model -> Html Msg
view model =
    div [ class "table-page" ]
        [ ComponentPage.view
            { title = "Table"
            , description = ""
            , specs = Nothing
            , sections = List.map (sectionConfig model) sectionConfigList
            }
        ]


sectionConfig : Model -> TableShowcaseConfig -> ComponentPage.SectionViewConfig Msg
sectionConfig model ({ label } as config) =
    { title = label
    , suggestions = Nothing
    , content = [ tableShowcase model config ]
    }


type alias TableShowcaseConfig =
    { id : String
    , label : String
    , tableType : Bool -> (PyxisTable.State -> Msg) -> PyxisTable.Config Msg
    , alternateRows : Bool
    }


tableShowcase : Model -> TableShowcaseConfig -> Html Msg
tableShowcase model { id, tableType, alternateRows } =
    ComponentViewer.view
        { id = id
        , isCodeVisible = ComponentPage.isInspecting id model
        , boxType = Box.Base
        , example = """TODO"""
        , label = ComponentViewer.boxTypeToLabel Box.Base
        , onTogglePreview = ToggleInspect
        , onCopyCode = CopyToClipboard
        }
        [ tableType True (UpdateTable id)
            |> PyxisTable.withAlternateRows alternateRows
            |> PyxisTable.addHeaders (createHeaders initialHeaders)
            |> PyxisTable.addRows (createRows initialRows)
            |> PyxisTable.addFooters (createRows [ initialHeaders ])
            |> PyxisTable.render (M.getTableState id model)
        ]


sectionConfigList : List TableShowcaseConfig
sectionConfigList =
    [ { id = "base"
      , label = "Base Table"
      , tableType = PyxisTable.base
      , alternateRows = False
      }
    , { id = "light"
      , label = "Light Table"
      , tableType = PyxisTable.light
      , alternateRows = False
      }
    , { id = "base-alt"
      , label = "Table Alternate"
      , tableType = PyxisTable.base
      , alternateRows = True
      }
    , { id = "light-alt"
      , label = "Light Table Alternate"
      , tableType = PyxisTable.light
      , alternateRows = True
      }
    ]


initialHeaders : List String
initialHeaders =
    [ "Nazione", "Capitale" ]


initialRows : List (List String)
initialRows =
    [ [ "Italia", "Roma" ]
    , [ "Francia", "Parigi" ]
    , [ "UK", "Londra" ]
    , [ "Russia", "Mosca" ]
    , [ "Spagna", "Madrid" ]
    , [ "Olanda", "Amsterdam" ]
    ]


createHeaders : List String -> List (PyxisTable.Header Msg)
createHeaders headers =
    List.map
        (\h ->
            PyxisTable.header (String.toLower h) [ Html.strong [] [ Html.text h ] ]
        )
        headers


createRows : List (List String) -> List (PyxisTable.Row Msg)
createRows rows =
    List.map (PyxisTable.row << createColumns) rows


createColumns : List String -> List (PyxisTable.Column Msg)
createColumns columns =
    List.map (PyxisTable.columnString 1) columns

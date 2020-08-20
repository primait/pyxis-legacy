module Pages.Table exposing
    ( Model
    , Msg(..)
    , init
    , update
    , view
    )

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Dict exposing (Dict)
import Helpers as H
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)
import Prima.Pyxis.Table as PyxisTable


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



-- UPDATE


type Msg
    = NoOp
    | ToggleInspect String Bool
    | UpdateTable String PyxisTable.State


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model
                |> H.withoutCmds

        ToggleInspect id isActive ->
            model
                |> ComponentPage.toggleInspect id isActive
                |> H.withoutCmds

        UpdateTable id newState ->
            model
                |> updateTableState id newState
                |> H.withoutCmds


updateTableState : String -> PyxisTable.State -> Model -> Model
updateTableState id newState model =
    if Dict.member id model.tableState then
        { model | tableState = Dict.insert id newState model.tableState }

    else
        model



-- VIEW


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
        , boxType = Box.Gray
        , example = """TODO"""
        , label = ComponentViewer.boxTypeToLabel Box.Gray
        , onTogglePreview = ToggleInspect
        }
        [ tableType True (UpdateTable id)
            |> PyxisTable.withAlternateRows alternateRows
            |> PyxisTable.addHeaders (createHeaders initialHeaders)
            |> PyxisTable.addRows (createRows initialRows)
            |> PyxisTable.addFooters (createRows [ initialHeaders ])
            |> PyxisTable.render (getTableState id model)
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

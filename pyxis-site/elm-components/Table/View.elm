module Table.View exposing (view)

import Html exposing (Html, div)
import Prima.Pyxis.Table as Table
import Pyxis.Helpers as Helpers
import Table.Model exposing (..)


view : Model -> Html Msg
view model =
    div
        []
        [ Helpers.syntaxWrapper
            ((List.singleton << Table.render model.tableState << createTableConfiguration) model)
        ]


createTableConfiguration : Model -> Table.Config Msg
createTableConfiguration model =
    Table.config
        Table.defaultType
        (createHeaders model.headers)
        (createRows model.rows)
        True


createHeaders : List String -> List (Table.Header Msg)
createHeaders headers =
    List.map createHeaderItem headers


createHeaderItem : String -> Table.Header Msg
createHeaderItem content =
    Table.header (String.toLower content) content (Just SortBy)


createRows : List (List String) -> List (Table.Row Msg)
createRows rows =
    List.map (Table.row << createColumns) rows


createColumns : List String -> List (Table.Column Msg)
createColumns columns =
    List.map (Table.columnString 1) columns

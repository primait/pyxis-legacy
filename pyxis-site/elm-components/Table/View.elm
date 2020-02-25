module Table.View exposing (view)

import Html exposing (Html)
import Prima.Pyxis.Table as Table
import Table.Model exposing (..)


view : Model -> Html Msg
view model =
    (Table.render model.tableState << createTableConfiguration) model


createTableConfiguration : Model -> Table.Config Msg
createTableConfiguration model =
    Table.config
        Table.defaultType
        True
        (createHeaders model.headers)
        (createRows model.rows)
        True
        []
        [ ( "my-custom-class", True ) ]


createHeaders : List String -> List (Table.Header Msg)
createHeaders headers =
    [ Table.header (String.toLower "Nazione") "Nazione" (Just SortBy)
    , Table.header (String.toLower "Paese") "Paese" (Just SortBy)
    ]


createHeaderItem : String -> Table.Header Msg
createHeaderItem content =
    Table.header (String.toLower content) content (Just SortBy)


createRows : List (List String) -> List (Table.Row Msg)
createRows rows =
    List.map (Table.row << createColumns) rows


createColumns : List String -> List (Table.Column Msg)
createColumns columns =
    List.map (Table.columnString 1) columns


createFooterColumns : List String -> List (Table.FooterColumn Msg)
createFooterColumns columns =
    List.map (Table.footerColumnString 1) columns

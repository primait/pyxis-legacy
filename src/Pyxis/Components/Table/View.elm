module Pyxis.Components.Table.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Pyxis.Components.Table.Model
    exposing
        ( Column(..)
        , Header(..)
        , Model
        , Msg(..)
        , Row(..)
        , Sort(..)
        , Table
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        , inspectableHtml
        , renderHTMLContent
        , renderOrNothing
        )


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Tables" ]
    , divider
    ]
        ++ List.map
            (\( name, { slug } as table ) ->
                (componentShowdown name slug InspectHtml
                    << List.singleton
                    << renderTable model.sortOrder
                )
                    table
            )
            model.tables


renderTable : Maybe Sort -> Table -> Html Msg
renderTable sortOrder { headers, rows } =
    table
        [ class "m-table m-table--alternateRows" ]
        [ renderTHead headers
        , renderTBody sortOrder rows
        ]


renderTHead : List (Header Msg) -> Html Msg
renderTHead headers =
    thead
        [ class "m-table__header" ]
        (List.map renderTH headers)


renderTH : Header Msg -> Html Msg
renderTH header =
    case header of
        DefaultHeader title ->
            th
                [ class "m-table__header__item fsSmall" ]
                [ text title ]

        SortableHeader title tagger ->
            th
                [ class "m-table__header__item m-table__header__item--sortable fsSmall"
                , onClick tagger
                ]
                [ text title ]


renderTBody : Maybe Sort -> List Row -> Html Msg
renderTBody sortOrder rows =
    let
        sortedRows : List Row
        sortedRows =
            case sortOrder of
                Nothing ->
                    rows

                Just Asc ->
                    List.sortBy rowToComparable rows

                Just Desc ->
                    (List.reverse << List.sortBy rowToComparable) rows

        rowToComparable : Row -> String
        rowToComparable (Row columns) =
            case columns of
                head :: tail ->
                    columnToComparable head

                _ ->
                    ""

        columnToComparable : Column -> String
        columnToComparable (Column content) =
            content
    in
    tbody
        [ class "m-table__body" ]
        (List.map renderTR sortedRows)


renderTR : Row -> Html Msg
renderTR (Row columns) =
    tr
        [ class "m-table__body__row" ]
        (List.map renderTD columns)


renderTD : Column -> Html Msg
renderTD (Column content) =
    td
        [ class "m-table__body__row__col fsSmall" ]
        [ text content ]

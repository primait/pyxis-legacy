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
            (\({ slug } as table) ->
                (componentShowdown "Sortable table" slug InspectHtml
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
                [ class "m-table__header__item fsSmall"
                , onClick tagger
                ]
                [ text title ]


renderTBody : Maybe Sort -> List Row -> Html Msg
renderTBody sortOrder rows =
    tbody
        [ class "m-table__body" ]
        (List.map (renderTR sortOrder) rows)


renderTR : Maybe Sort -> Row -> Html Msg
renderTR sortOrder (Row columns) =
    let
        sortedColumns =
            case sortOrder of
                Nothing ->
                    columns

                Just Asc ->
                    List.sortBy columnToComparable columns

                Just Desc ->
                    (List.reverse << List.sortBy columnToComparable) columns

        columnToComparable col =
            case col of
                DefaultColumn content ->
                    content

                HtmlColumn content ->
                    content
    in
    tr
        [ class "m-table__body__row" ]
        (List.map renderTD sortedColumns)


renderTD : Column -> Html Msg
renderTD column =
    case column of
        DefaultColumn content ->
            td
                [ class "m-table__body__row__col fsSmall" ]
                [ text content ]

        HtmlColumn htmlContent ->
            td
                [ class "m-table__body__row__col fsSmall" ]
                (renderHTMLContent htmlContent)

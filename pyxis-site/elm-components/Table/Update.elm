module Table.Update exposing (update)

import Prima.Pyxis.Table as Table
import Table.Model
    exposing
        ( Model
        , Msg(..)
        , Sort(..)
        )


update : Msg -> Model -> Model
update msg model =
    case msg of
        Table ->
            model

        SortBy headerSlug ->
            let
                ( sortAlgorithm, sortMapper ) =
                    case model.sortBy of
                        Nothing ->
                            ( Just Asc, Table.sortByAsc )

                        Just Asc ->
                            ( Just Desc, Table.sortByDesc )

                        Just Desc ->
                            ( Nothing, Table.sortByNothing )
            in
            { model
                | sortBy = sortAlgorithm
                , tableState = sortMapper headerSlug model.tableState
            }

module Pages.Table.Update exposing (..)

import Dict
import Helpers as H
import Pages.Component as ComponentPage
import Pages.Table.Model exposing (Model, Msg(..))
import Ports as P
import Prima.Pyxis.Table as PyxisTable


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

        CopyToClipboard text ->
            ( model, P.copyToClipboard text )

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

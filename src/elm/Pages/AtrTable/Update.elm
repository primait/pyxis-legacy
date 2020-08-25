module Pages.AtrTable.Update exposing (update)

import Helpers as H
import Pages.AtrTable.Model exposing (Model, Msg(..))
import Pages.Component as ComponentPage
import Ports as P
import Prima.Pyxis.AtrTable as AtrTable


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

        UpdateAtrTable submsg ->
            model
                |> updateTable submsg
                |> H.withoutCmds


updateTable : AtrTable.Msg -> Model -> Model
updateTable msg model =
    let
        ( newState, _, _ ) =
            AtrTable.update msg model.atrTable
    in
    { model | atrTable = newState }

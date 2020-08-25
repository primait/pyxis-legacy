module Pages.ListChooser.Update exposing (..)

import Helpers as H
import Pages.Component as ComponentPage
import Pages.ListChooser.Model as M exposing (Model, Msg(..))
import Prima.Pyxis.ListChooser as PyxisListChooser


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

        UpdateSingleSelect submsg ->
            model
                |> updateSingleSelectList submsg
                |> H.withoutCmds

        UpdateMultiSelect submsg ->
            model
                |> updateMultiSelectList submsg
                |> H.withoutCmds


updateSingleSelectList : PyxisListChooser.Msg -> Model -> Model
updateSingleSelectList msg model =
    { model | singleSelectList = PyxisListChooser.update msg M.baseConfig model.singleSelectList }


updateMultiSelectList : PyxisListChooser.Msg -> Model -> Model
updateMultiSelectList msg model =
    { model | multiSelectList = PyxisListChooser.update msg M.multiSelectConfig model.multiSelectList }

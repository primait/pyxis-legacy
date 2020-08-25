module Pages.Form.Update exposing (..)

import Helpers as H
import Pages.Component as ComponentPage
import Pages.Form.Model as M exposing (Model, Msg(..))
import Ports as P


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

        UpdateStringField id value ->
            model
                |> M.setFieldValue id value
                |> H.withoutCmds

        ToggleBoolField id value ->
            model
                |> M.setBoolField id value
                |> H.withoutCmds

        ToggleStringSet id value ->
            model
                |> M.toggleCheckboxValue id value
                |> H.withoutCmds

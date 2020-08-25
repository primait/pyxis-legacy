module Pages.Message.Update exposing (..)

import Helpers as H
import Pages.Component as ComponentPage
import Pages.Message.Model exposing (Model, Msg(..))
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

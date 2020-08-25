module Pages.Badge.Update exposing (update)

import Helpers as H
import Pages.Badge.Model exposing (Model, Msg(..))
import Pages.Component as ComponentPage
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

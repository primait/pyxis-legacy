module Pages.Button.Update exposing (update)

import Dict
import Helpers as PH
import Pages.Button.Model exposing (Model, Msg(..))
import Ports as P


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model |> PH.withoutCmds

        ToggleInspectMode id newState ->
            ( { model | inspectMode = Dict.insert id newState model.inspectMode }, Cmd.none )

        CopyToClipboard text ->
            ( model, P.copyToClipboard text )

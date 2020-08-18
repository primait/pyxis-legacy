module Pages.Button.Update exposing (update)

import Dict
import Helpers as PH
import Pages.Button.Model exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model |> PH.withoutCmds

        ToggleInspectMode id newState ->
            ( { model | isInspecting = Dict.insert id newState model.isInspecting }, Cmd.none )

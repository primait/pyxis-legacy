module Pages.Button.Update exposing (update)

import Helpers as PH
import Pages.Button.Model exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model |> PH.withoutCmds

        ToggleInspectMode newState ->
            ( { model | isInspecting = newState }, Cmd.none )

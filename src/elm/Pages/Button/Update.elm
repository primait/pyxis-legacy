module Pages.Button.Update exposing (update)

import Helpers as PH
import Pages.Button.Model exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click ->
            model
                |> PH.withoutCmds

        DoubleClick ->
            model
                |> PH.withoutCmds

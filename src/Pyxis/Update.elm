module Pyxis.Update exposing (..)

import Pyxis.Helpers as PH
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Router as Router
import Pyxis.Update.Helpers as UH


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangedUrl route ->
            model
                |> UH.updateRoute (Router.fromUrl route)
                |> PH.withoutCmds

        ClickedLink urlRequest ->
            model
                |> PH.withoutCmds

        AccordionMsg subMsg ->
            model
                |> UH.dispatchAccordionSubMsg subMsg
                |> PH.withoutCmds

        ButtonMsg subMsg ->
            model
                |> UH.dispatchButtonSubMsg subMsg
                |> PH.withoutCmds

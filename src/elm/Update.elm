module Update exposing (update)

import Helpers as PH
import Model exposing (Model, Msg(..))
import Router as Router
import Update.Helpers as UH


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

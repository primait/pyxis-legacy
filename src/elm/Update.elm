module Update exposing (update)

import Helpers as H
import Model exposing (Model, Msg(..))
import Route
import Update.Helpers as UH


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model
                |> H.withoutCmds

        ChangedUrl route ->
            model
                |> UH.updateRoute (Route.fromUrl route)
                |> H.withoutCmds

        ClickedLink urlRequest ->
            model
                |> H.withoutCmds

        AccordionMsg subMsg ->
            model
                |> UH.dispatchAccordionSubMsg subMsg
                |> H.withoutCmds

        ButtonMsg subMsg ->
            model
                |> UH.dispatchButtonSubMsg subMsg
                |> H.withoutCmds

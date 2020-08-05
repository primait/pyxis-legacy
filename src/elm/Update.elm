module Update exposing (update)

import Browser
import Browser.Navigation as Nav
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

        ChangedUrl url ->
            model
                |> UH.setRoute (Route.fromUrl url)
                |> H.withoutCmds

        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    model
                        |> H.withCmds [ Route.pushUrl model.key (Route.fromUrl url) ]

                Browser.External href ->
                    model
                        |> H.withCmds [ Nav.load href ]

        AccordionMsg subMsg ->
            model
                |> UH.dispatchAccordionSubMsg subMsg
                |> H.withoutCmds

        ButtonMsg subMsg ->
            model
                |> UH.dispatchButtonSubMsg subMsg
                |> H.withoutCmds

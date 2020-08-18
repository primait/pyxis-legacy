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
                        |> UH.setMenuOpen False
                        |> H.withCmds [ Route.pushUrl model.key model.language (Route.fromUrl url) ]

                Browser.External href ->
                    model
                        |> H.withCmds [ Nav.load href ]

        ChangeRoute maybeRoute ->
            case maybeRoute of
                Nothing ->
                    model |> H.withoutCmds

                Just route ->
                    model
                        |> UH.setRoute route
                        |> H.withoutCmds

        ToggleMenu value ->
            model
                |> UH.setMenuOpen value
                |> H.withoutCmds

        ToggleDropDown id value ->
            model
                |> UH.setDropdownOpen id value
                |> H.withoutCmds

        AccordionMsg subMsg ->
            model
                |> UH.dispatchAccordionSubMsg subMsg
                |> H.withoutCmds

        ButtonMsg subMsg ->
            model
                |> UH.dispatchButtonSubMsg subMsg
                |> H.withoutCmds

        LoaderMsg submsg ->
            model
                |> UH.dispatchLoaderSubMsg submsg
                |> H.withoutCmds

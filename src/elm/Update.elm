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
                    if String.isEmpty href then
                        model
                            |> H.withoutCmds

                    else
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

        AccordionPageMsg subMsg ->
            model
                |> UH.dispatchAccordionSubMsg subMsg
                |> H.withoutCmds

        AtrTablePageMsg submsg ->
            model
                |> UH.dispatchAtrTableSubMsg submsg
                |> H.withoutCmds

        BadgePageMsg subMsg ->
            model
                |> UH.dispatchBadgeSubMsg subMsg
                |> H.withoutCmds

        ButtonPageMsg subMsg ->
            model
                |> UH.dispatchButtonSubMsg subMsg
                |> H.withoutCmds

        ContainerPageMsg submsg ->
            model
                |> UH.dispatchContainerSubMsg submsg
                |> H.withoutCmds

        FormPageMsg submsg ->
            model
                |> UH.dispatchFormSubMsg submsg
                |> H.withoutCmds

        LinkPageMsg submsg ->
            model
                |> UH.dispatchLinkSubMsg submsg
                |> H.withoutCmds

        ListChooserPageMsg submsg ->
            model
                |> UH.dispatchListChooserSubMsg submsg
                |> H.withoutCmds

        LoaderPageMsg submsg ->
            model
                |> UH.dispatchLoaderSubMsg submsg
                |> H.withoutCmds

        MessagePageMsg submsg ->
            model
                |> UH.dispatchMessageSubMsg submsg
                |> H.withoutCmds

        ModalPageMsg submsg ->
            model
                |> UH.dispatchModalSubMsg submsg
                |> H.withoutCmds

        TablePageMsg submsg ->
            model
                |> UH.dispatchTableSubMsg submsg
                |> H.withoutCmds

        TooltipPageMsg submsg ->
            model
                |> UH.dispatchTooltipSubMsg submsg
                |> H.withoutCmds

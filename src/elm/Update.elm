module Update exposing (update)

import Browser
import Browser.Navigation as Nav
import Helpers as H
import Model exposing (Model, Msg(..))
import Ports as P
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

        CopyToClipboard text ->
            model
                |> H.withCmds [ P.copyToClipboard text ]

        {- PAGES UPDATES -}
        AccordionPageMsg subMsg ->
            model
                |> UH.dispatchAccordionSubMsg subMsg

        AtrTablePageMsg submsg ->
            model
                |> UH.dispatchAtrTableSubMsg submsg

        BadgePageMsg subMsg ->
            model
                |> UH.dispatchBadgeSubMsg subMsg

        ButtonPageMsg subMsg ->
            model
                |> UH.dispatchButtonSubMsg subMsg

        ContainerPageMsg submsg ->
            model
                |> UH.dispatchContainerSubMsg submsg

        FormPageMsg submsg ->
            model
                |> UH.dispatchFormSubMsg submsg

        LinkPageMsg submsg ->
            model
                |> UH.dispatchLinkSubMsg submsg

        ListChooserPageMsg submsg ->
            model
                |> UH.dispatchListChooserSubMsg submsg

        LoaderPageMsg submsg ->
            model
                |> UH.dispatchLoaderSubMsg submsg

        MessagePageMsg submsg ->
            model
                |> UH.dispatchMessageSubMsg submsg

        ModalPageMsg submsg ->
            model
                |> UH.dispatchModalSubMsg submsg

        TablePageMsg submsg ->
            model
                |> UH.dispatchTableSubMsg submsg

        TooltipPageMsg submsg ->
            model
                |> UH.dispatchTooltipSubMsg submsg

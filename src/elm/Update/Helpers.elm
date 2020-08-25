module Update.Helpers exposing (..)

import Dict
import Model exposing (Model, Msg(..))
import Pages.Accordion.Model as AccordionModel
import Pages.Accordion.Update as AccordionUpdate
import Pages.AtrTable.Model as AtrTableModel
import Pages.AtrTable.Update as AtrTableUpdate
import Pages.Badge.Model as BadgeModel
import Pages.Badge.Update as BadgeUpdate
import Pages.Button.Model as ButtonModel
import Pages.Button.Update as ButtonUpdate
import Pages.Container.Model as ContainerModel
import Pages.Container.Update as ContainerUpdate
import Pages.Form.Model as FormModel
import Pages.Form.Update as FormUpdate
import Pages.Link.Model as LinkModel
import Pages.Link.Update as LinkUpdate
import Pages.ListChooser.Model as ListChooserModel
import Pages.ListChooser.Update as ListChooserUpdate
import Pages.Loader.Model as LoaderModel
import Pages.Loader.Update as LoaderUpdate
import Pages.Message.Model as MessageModel
import Pages.Message.Update as MessageUpdate
import Pages.Modal.Model as ModalModel
import Pages.Modal.Update as ModalUpdate
import Pages.Table.Model as TableModel
import Pages.Table.Update as TableUpdate
import Pages.Tooltip.Model as TooltipModel
import Pages.Tooltip.Update as TooltipUpdate
import Route exposing (Route(..))


setMenuOpen : Bool -> Model -> Model
setMenuOpen open model =
    { model | isMenuOpen = open }


setDropdownOpen : String -> Bool -> Model -> Model
setDropdownOpen id open model =
    let
        updatedState =
            if Dict.member id model.navbarMenuState then
                Dict.insert id open model.navbarMenuState

            else
                model.navbarMenuState
    in
    { model | navbarMenuState = updatedState }


setRoute : Route -> Model -> Model
setRoute newRoute model =
    { model | currentRoute = newRoute }


dispatchAccordionSubMsg : AccordionModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchAccordionSubMsg msg model =
    let
        ( newState, cmd ) =
            AccordionUpdate.update msg model.accordionModel
    in
    ( { model | accordionModel = newState }, Cmd.map AccordionPageMsg cmd )


dispatchAtrTableSubMsg : AtrTableModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchAtrTableSubMsg msg model =
    let
        ( newState, cmd ) =
            AtrTableUpdate.update msg model.atrTableModel
    in
    ( { model | atrTableModel = newState }, Cmd.map AtrTablePageMsg cmd )


dispatchBadgeSubMsg : BadgeModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchBadgeSubMsg msg model =
    let
        ( newState, cmd ) =
            BadgeUpdate.update msg model.badgeModel
    in
    ( { model | badgeModel = newState }, Cmd.map BadgePageMsg cmd )


dispatchButtonSubMsg : ButtonModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchButtonSubMsg msg model =
    let
        ( newState, cmd ) =
            ButtonUpdate.update msg model.buttonModel
    in
    ( { model | buttonModel = newState }, Cmd.map ButtonPageMsg cmd )


dispatchContainerSubMsg : ContainerModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchContainerSubMsg msg model =
    let
        ( newState, cmd ) =
            ContainerUpdate.update msg model.containerModel
    in
    ( { model | containerModel = newState }, Cmd.map ContainerPageMsg cmd )


dispatchFormSubMsg : FormModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchFormSubMsg msg model =
    let
        ( newState, cmd ) =
            FormUpdate.update msg model.formModel
    in
    ( { model | formModel = newState }, Cmd.map FormPageMsg cmd )


dispatchLinkSubMsg : LinkModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchLinkSubMsg msg model =
    let
        ( newState, cmd ) =
            LinkUpdate.update msg model.linkModel
    in
    ( { model | linkModel = newState }, Cmd.map LinkPageMsg cmd )


dispatchListChooserSubMsg : ListChooserModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchListChooserSubMsg msg model =
    let
        ( newState, cmd ) =
            ListChooserUpdate.update msg model.listChooserModel
    in
    ( { model | listChooserModel = newState }, Cmd.map ListChooserPageMsg cmd )


dispatchLoaderSubMsg : LoaderModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchLoaderSubMsg msg model =
    let
        ( newState, cmd ) =
            LoaderUpdate.update msg model.loaderModel
    in
    ( { model | loaderModel = newState }, Cmd.map LoaderPageMsg cmd )


dispatchMessageSubMsg : MessageModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchMessageSubMsg msg model =
    let
        ( newState, cmd ) =
            MessageUpdate.update msg model.messageModel
    in
    ( { model | messageModel = newState }, Cmd.map MessagePageMsg cmd )


dispatchModalSubMsg : ModalModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchModalSubMsg msg model =
    let
        ( newState, cmd ) =
            ModalUpdate.update msg model.modalModel
    in
    ( { model | modalModel = newState }, Cmd.map ModalPageMsg cmd )


dispatchTableSubMsg : TableModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchTableSubMsg msg model =
    let
        ( newState, cmd ) =
            TableUpdate.update msg model.tableModel
    in
    ( { model | tableModel = newState }, Cmd.map TablePageMsg cmd )


dispatchTooltipSubMsg : TooltipModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchTooltipSubMsg msg model =
    let
        ( newState, cmd ) =
            TooltipUpdate.update msg model.tooltipModel
    in
    ( { model | tooltipModel = newState }, Cmd.map TooltipPageMsg cmd )

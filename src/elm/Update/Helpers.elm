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


dispatchAccordionSubMsg : AccordionModel.Msg -> Model -> Model
dispatchAccordionSubMsg msg model =
    { model | accordionModel = Tuple.first <| AccordionUpdate.update msg model.accordionModel }


dispatchAtrTableSubMsg : AtrTableModel.Msg -> Model -> Model
dispatchAtrTableSubMsg msg model =
    { model | atrTableModel = Tuple.first <| AtrTableUpdate.update msg model.atrTableModel }


dispatchBadgeSubMsg : BadgeModel.Msg -> Model -> Model
dispatchBadgeSubMsg msg model =
    { model | badgeModel = Tuple.first <| BadgeUpdate.update msg model.badgeModel }


dispatchButtonSubMsg : ButtonModel.Msg -> Model -> ( Model, Cmd Msg )
dispatchButtonSubMsg msg model =
    let
        newState =
            ButtonUpdate.update msg model.buttonModel
    in
    ( { model | buttonModel = Tuple.first newState }, Cmd.map ButtonPageMsg (Tuple.second newState) )


dispatchContainerSubMsg : ContainerModel.Msg -> Model -> Model
dispatchContainerSubMsg msg model =
    { model | containerModel = Tuple.first <| ContainerUpdate.update msg model.containerModel }


dispatchFormSubMsg : FormModel.Msg -> Model -> Model
dispatchFormSubMsg msg model =
    let
        newState =
            FormUpdate.update msg model.formModel
    in
    { model | formModel = Tuple.first newState }


dispatchLinkSubMsg : LinkModel.Msg -> Model -> Model
dispatchLinkSubMsg msg model =
    { model | linkModel = Tuple.first <| LinkUpdate.update msg model.linkModel }


dispatchListChooserSubMsg : ListChooserModel.Msg -> Model -> Model
dispatchListChooserSubMsg msg model =
    { model | listChooserModel = Tuple.first <| ListChooserUpdate.update msg model.listChooserModel }


dispatchLoaderSubMsg : LoaderModel.Msg -> Model -> Model
dispatchLoaderSubMsg msg model =
    { model | loaderModel = Tuple.first <| LoaderUpdate.update msg model.loaderModel }


dispatchMessageSubMsg : MessageModel.Msg -> Model -> Model
dispatchMessageSubMsg msg model =
    { model | messageModel = Tuple.first <| MessageUpdate.update msg model.messageModel }


dispatchModalSubMsg : ModalModel.Msg -> Model -> Model
dispatchModalSubMsg msg model =
    { model | modalModel = Tuple.first <| ModalUpdate.update msg model.modalModel }


dispatchTableSubMsg : TableModel.Msg -> Model -> Model
dispatchTableSubMsg msg model =
    { model | tableModel = Tuple.first <| TableUpdate.update msg model.tableModel }


dispatchTooltipSubMsg : TooltipModel.Msg -> Model -> Model
dispatchTooltipSubMsg msg model =
    { model | tooltipModel = Tuple.first <| TooltipUpdate.update msg model.tooltipModel }

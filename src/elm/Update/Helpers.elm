module Update.Helpers exposing (..)

import Dict
import Model exposing (Model)
import Pages.Accordion.Model as AccordionModel
import Pages.Accordion.Update as AccordionUpdate
import Pages.AtrTable
import Pages.Badge
import Pages.Button.Model as ButtonModel
import Pages.Button.Update as ButtonUpdate
import Pages.Container
import Pages.Form
import Pages.Link
import Pages.ListChooser
import Pages.Loader
import Pages.Message
import Pages.Modal
import Pages.Table
import Pages.Tooltip
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


dispatchAtrTableSubMsg : Pages.AtrTable.Msg -> Model -> Model
dispatchAtrTableSubMsg msg model =
    { model | atrTableModel = Tuple.first <| Pages.AtrTable.update msg model.atrTableModel }


dispatchBadgeSubMsg : Pages.Badge.Msg -> Model -> Model
dispatchBadgeSubMsg msg model =
    { model | badgeModel = Tuple.first <| Pages.Badge.update msg model.badgeModel }


dispatchButtonSubMsg : ButtonModel.Msg -> Model -> Model
dispatchButtonSubMsg msg model =
    { model | buttonModel = Tuple.first <| ButtonUpdate.update msg model.buttonModel }


dispatchContainerSubMsg : Pages.Container.Msg -> Model -> Model
dispatchContainerSubMsg msg model =
    { model | containerModel = Tuple.first <| Pages.Container.update msg model.containerModel }


dispatchFormSubMsg : Pages.Form.Msg -> Model -> Model
dispatchFormSubMsg msg model =
    { model | formModel = Tuple.first <| Pages.Form.update msg model.formModel }


dispatchLinkSubMsg : Pages.Link.Msg -> Model -> Model
dispatchLinkSubMsg msg model =
    { model | linkModel = Tuple.first <| Pages.Link.update msg model.linkModel }


dispatchListChooserSubMsg : Pages.ListChooser.Msg -> Model -> Model
dispatchListChooserSubMsg msg model =
    { model | listChooserModel = Tuple.first <| Pages.ListChooser.update msg model.listChooserModel }


dispatchLoaderSubMsg : Pages.Loader.Msg -> Model -> Model
dispatchLoaderSubMsg msg model =
    { model | loaderModel = Tuple.first <| Pages.Loader.update msg model.loaderModel }


dispatchMessageSubMsg : Pages.Message.Msg -> Model -> Model
dispatchMessageSubMsg msg model =
    { model | messageModel = Tuple.first <| Pages.Message.update msg model.messageModel }


dispatchModalSubMsg : Pages.Modal.Msg -> Model -> Model
dispatchModalSubMsg msg model =
    { model | modalModel = Tuple.first <| Pages.Modal.update msg model.modalModel }


dispatchTableSubMsg : Pages.Table.Msg -> Model -> Model
dispatchTableSubMsg msg model =
    { model | tableModel = Tuple.first <| Pages.Table.update msg model.tableModel }


dispatchTooltipSubMsg : Pages.Tooltip.Msg -> Model -> Model
dispatchTooltipSubMsg msg model =
    { model | tooltipModel = Tuple.first <| Pages.Tooltip.update msg model.tooltipModel }

module Update.Helpers exposing (..)

import Dict
import Model exposing (Model)
import Pages.Accordion.Model as AccordionModel
import Pages.Accordion.Update as AccordionUpdate
import Pages.Button.Model as ButtonModel
import Pages.Button.Update as ButtonUpdate
import Route exposing (Route(..))


setMenuOpen : Bool -> Model -> Model
setMenuOpen open model =
    { model | isMenuOpen = open }


setDropdownOpen : String -> Bool -> Model -> Model
setDropdownOpen id open model =
    let
        updatedMenu =
            Dict.insert id open model.navbarMenuState
    in
    { model | navbarMenuState = updatedMenu }


setRoute : Maybe Route -> Model -> Model
setRoute newRoute model =
    case newRoute of
        Nothing ->
            model

        Just route ->
            { model | currentRoute = route }


dispatchAccordionSubMsg : AccordionModel.Msg -> Model -> Model
dispatchAccordionSubMsg msg model =
    { model | accordionModel = Tuple.first <| AccordionUpdate.update msg model.accordionModel }


dispatchButtonSubMsg : ButtonModel.Msg -> Model -> Model
dispatchButtonSubMsg msg model =
    { model | buttonModel = Tuple.first <| ButtonUpdate.update msg model.buttonModel }

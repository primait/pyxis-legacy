module Update.Helpers exposing (..)

import Dict
import Model exposing (Model)
import Pages.Accordion.Model as AccordionModel
import Pages.Accordion.Update as AccordionUpdate
import Pages.Button.Model as ButtonModel
import Pages.Button.Update as ButtonUpdate
import Pages.Loader as LoaderPage
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


dispatchButtonSubMsg : ButtonModel.Msg -> Model -> Model
dispatchButtonSubMsg msg model =
    { model | buttonModel = Tuple.first <| ButtonUpdate.update msg model.buttonModel }


dispatchLoaderSubMsg : LoaderPage.Msg -> Model -> Model
dispatchLoaderSubMsg msg model =
    { model | loaderModel = Tuple.first <| LoaderPage.update msg model.loaderModel }

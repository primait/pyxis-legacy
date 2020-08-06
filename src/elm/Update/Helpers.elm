module Update.Helpers exposing (..)

import Model exposing (Model)
import Pages.Accordion.Model as AccordionModel
import Pages.Accordion.Update as AccordionUpdate
import Pages.Button.Model as ButtonModel
import Pages.Button.Update as ButtonUpdate
import Route exposing (Route(..))


setMenuOpen : Bool -> Model -> Model
setMenuOpen open model =
    { model | isMenuOpen = open }


setRoute : Maybe Route -> Model -> Model
setRoute newRoute model =
    { model | currentRoute = Maybe.withDefault Route.NotFound newRoute }


dispatchAccordionSubMsg : AccordionModel.Msg -> Model -> Model
dispatchAccordionSubMsg msg model =
    { model | accordionModel = Tuple.first <| AccordionUpdate.update msg model.accordionModel }


dispatchButtonSubMsg : ButtonModel.Msg -> Model -> Model
dispatchButtonSubMsg msg model =
    { model | buttonModel = Tuple.first <| ButtonUpdate.update msg model.buttonModel }

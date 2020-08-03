module Update.Helpers exposing (..)

import Model exposing (Model)
import Pages.Accordion.Model as AccordionModel
import Pages.Accordion.Update as AccordionUpdate
import Pages.Button.Model as ButtonModel
import Pages.Button.Update as ButtonUpdate
import Router as Router exposing (Route(..))


updateRoute : Maybe Route -> Model -> Model
updateRoute maybeRoute model =
    { model | currentRoute = Maybe.withDefault Router.NotFound maybeRoute }


dispatchAccordionSubMsg : AccordionModel.Msg -> Model -> Model
dispatchAccordionSubMsg msg model =
    { model | accordionModel = Tuple.first <| AccordionUpdate.update msg model.accordionModel }


dispatchButtonSubMsg : ButtonModel.Msg -> Model -> Model
dispatchButtonSubMsg msg model =
    { model | buttonModel = Tuple.first <| ButtonUpdate.update msg model.buttonModel }

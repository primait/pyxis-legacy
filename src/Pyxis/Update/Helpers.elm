module Pyxis.Update.Helpers exposing (..)

import Pyxis.Model exposing (Model)
import Pyxis.Pages.Accordion.Model as AccordionModel
import Pyxis.Pages.Accordion.Update as AccordionUpdate
import Pyxis.Router as Router exposing (Route(..))


updateRoute : Maybe Route -> Model -> Model
updateRoute maybeRoute model =
    { model | currentRoute = Maybe.withDefault Router.NotFound maybeRoute }


dispatchAccordionSubMsg : AccordionModel.Msg -> Model -> Model
dispatchAccordionSubMsg msg model =
    { model | accordionModel = Tuple.first <| AccordionUpdate.update msg model.accordionModel }

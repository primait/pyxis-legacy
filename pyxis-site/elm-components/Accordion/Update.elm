module Accordion.Update exposing (update)

import Accordion.Model
    exposing
        ( Accordion
        , Model
        , Msg(..)
        )
import Prima.Pyxis.Accordion as Accordion


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleAccordion slug isOpen ->
            { model | accordionList = List.map (updateAccordion slug isOpen) model.accordionList }


updateAccordion : String -> Bool -> Accordion -> Accordion
updateAccordion slug isOpen accordion =
    case ( slug == accordion.slug, isOpen ) of
        ( True, False ) ->
            updateAccordionState Accordion.open accordion

        ( _, _ ) ->
            updateAccordionState Accordion.close accordion


updateAccordionState : (Accordion.State Msg -> Accordion.State Msg) -> Accordion -> Accordion
updateAccordionState mapper accordion =
    { accordion | state = mapper accordion.state }

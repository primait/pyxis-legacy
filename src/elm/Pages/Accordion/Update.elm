module Pages.Accordion.Update exposing (update)

import Dict
import Helpers as PH
import Pages.Accordion.Model as M exposing (AccordionId(..), Model, Msg(..))
import Prima.Pyxis.Accordion as PyxisAccordion


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model
                |> PH.withoutCmds

        ToggleInspect id isOpen ->
            model
                |> updateCodeViewer id isOpen
                |> PH.withoutCmds

        ToggleAccordion id isOpen ->
            model
                |> updateAccordion id isOpen
                |> PH.withoutCmds


updateCodeViewer : String -> Bool -> Model -> Model
updateCodeViewer id isOpen model =
    { model | isInspecting = Dict.insert id isOpen model.isInspecting }


updateAccordion : String -> Bool -> Model -> Model
updateAccordion id isOpen model =
    let
        newState =
            if isOpen then
                PyxisAccordion.close

            else
                PyxisAccordion.open
    in
    { model
        | accordionsState =
            model.accordionsState
                |> Dict.insert id newState
    }

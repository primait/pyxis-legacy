module Pyxis.Pages.Accordion.Update exposing (..)

import Prima.Pyxis.Accordion as PyxisAccordion
import Pyxis.Helpers as PH
import Pyxis.Pages.Accordion.Model as M exposing (Accordion(..), Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle slug isOpen ->
            model
                |> updateAccordion slug isOpen
                |> PH.withoutCmds


updateAccordion : String -> Bool -> Model -> Model
updateAccordion slug isOpen model =
    let
        newState =
            if isOpen then
                PyxisAccordion.close

            else
                PyxisAccordion.open
    in
    case M.fromSlug slug of
        Just Light ->
            { model | accordionLight = newState }

        Just Base ->
            { model | accordionBase = newState }

        Just Dark ->
            { model | accordionDark = newState }

        _ ->
            model

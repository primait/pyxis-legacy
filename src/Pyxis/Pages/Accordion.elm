module Pyxis.Pages.Accordion exposing (view)

import Html exposing (Html, br, div, text)
import Prima.Pyxis.Accordion as PyxisAccordion
import Pyxis.Pages.Accordion.Model as M exposing (Accordion(..), Model, Msg)


view : Model -> Html Msg
view model =
    div
        []
        [ PyxisAccordion.light (M.toSlug Light) M.Toggle
            |> PyxisAccordion.withSimpleTitle title
            |> PyxisAccordion.withContent content
            |> PyxisAccordion.render model.accordionLight
        , PyxisAccordion.base (M.toSlug Base) M.Toggle
            |> PyxisAccordion.withSimpleTitle title
            |> PyxisAccordion.withContent content
            |> PyxisAccordion.render model.accordionBase
        , PyxisAccordion.dark (M.toSlug Dark) M.Toggle
            |> PyxisAccordion.withSimpleTitle title
            |> PyxisAccordion.withContent content
            |> PyxisAccordion.render model.accordionDark
        ]


title : String
title =
    "Lorem ipsum dolor sit amet."


content : List (Html Msg)
content =
    [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
    , br [] []
    , text "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    ]

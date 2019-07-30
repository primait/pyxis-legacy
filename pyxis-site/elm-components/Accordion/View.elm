module Accordion.View exposing
    ( accordionConfig
    , accordionRender
    , view
    )

import Accordion.Model
    exposing
        ( Accordion
        , AccordionType(..)
        , Model
        , Msg(..)
        )
import Html exposing (..)
import Prima.Pyxis.Accordion as Accordion
import Pyxis.Helpers as Helpers


view : Model -> Html Msg
view model =
    div
        []
        [ Helpers.syntaxWrapper
            ((List.intersperse Helpers.spacer << List.map accordionRender) model.accordionList)
        ]


accordionRender : Accordion -> Html Msg
accordionRender accordion =
    Accordion.render accordion.state (accordionConfig accordion)


accordionConfig : Accordion -> Accordion.Config Msg
accordionConfig accordion =
    (case accordion.accordionType of
        Light ->
            Accordion.lightConfig

        Dark ->
            Accordion.darkConfig

        Base ->
            Accordion.baseConfig
    )
        accordion.slug
        ToggleAccordion

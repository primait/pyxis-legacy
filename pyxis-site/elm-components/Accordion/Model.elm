module Accordion.Model exposing
    ( Accordion
    , AccordionType(..)
    , Flags
    , Model
    , Msg(..)
    , accordionBuilder
    , accordionTypeFromString
    , initialModel
    )

import Html exposing (..)
import Prima.Pyxis.Accordion as Accordion
import Pyxis.Helpers as Helpers


type Msg
    = ToggleAccordion String Bool


type alias Model =
    { accordionList : List Accordion
    }


initialModel : Model
initialModel =
    Model []


type alias Accordion =
    { accordionType : AccordionType
    , slug : String
    , state : Accordion.State Msg
    }


type AccordionType
    = Base
    | Dark
    | Light


accordionTypeFromString : String -> Maybe AccordionType
accordionTypeFromString str =
    case String.toLower str of
        "base" ->
            Just Base

        "dark" ->
            Just Dark

        "light" ->
            Just Light

        _ ->
            Nothing


accordionBuilder : AccordionType -> Accordion
accordionBuilder type_ =
    Accordion type_ (accordionTypeToSlug type_) (Accordion.state False (accordionTypeToTitle type_) accordionContent)


accordionTypeToSlug : AccordionType -> String
accordionTypeToSlug type_ =
    case type_ of
        Base ->
            "slug-accordion-base"

        Light ->
            "slug-accordion-light"

        Dark ->
            "slug-accordion-dark"


accordionTypeToTitle : AccordionType -> String
accordionTypeToTitle type_ =
    case type_ of
        Base ->
            "I am a base accordion"

        Light ->
            "I am a light accordion"

        Dark ->
            "I am a dark accordion"


accordionContent : List (Html Msg)
accordionContent =
    [ text Helpers.loremIpsum ]


type alias Flags =
    { accordionType : String
    }

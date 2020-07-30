module Pyxis.Pages.Accordion.Model exposing
    ( Accordion(..)
    , Model
    , Msg(..)
    , fromSlug
    , initialModel
    , toSlug
    )

import Prima.Pyxis.Accordion as Accordion


type Msg
    = Toggle String Bool


type alias Model =
    { accordionLight : Accordion.State
    , accordionBase : Accordion.State
    , accordionDark : Accordion.State
    }


initialModel : Model
initialModel =
    { accordionLight = Accordion.close
    , accordionBase = Accordion.close
    , accordionDark = Accordion.close
    }


type Accordion
    = Light
    | Base
    | Dark


toSlug : Accordion -> String
toSlug accordion =
    case accordion of
        Light ->
            "accordion_light"

        Base ->
            "accordion_base"

        Dark ->
            "accordion_dark"


fromSlug : String -> Maybe Accordion
fromSlug str =
    case str of
        "accordion_light" ->
            Just Light

        "accordion_base" ->
            Just Base

        "accordion_dark" ->
            Just Dark

        _ ->
            Nothing

module Pyxis.Components.Accordions.Model exposing
    ( Accordion
    , AccordionTone(..)
    , Model
    , Msg(..)
    , accordionToneToString
    , initialModel
    )


type Msg
    = InspectHtml String
    | Toggle String


type alias Model =
    { accordions : List Accordion }


initialModel : Model
initialModel =
    Model
        [ Accordion "a_1" "accordion" False "Contenuto accordion" AccordionDark
        , Accordion "a_2" "accordion Dark" False "Contenuto accordion" AccordionDark
        , Accordion "a_3" "accordion Base" False "Contenuto accordion" AccordionBase
        , Accordion "a_4" "accordion Light" False "Contenuto accordion" AccordionLight
        ]


type AccordionTone
    = AccordionDark
    | AccordionBase
    | AccordionLight


type alias Accordion =
    { slug : String
    , name : String
    , isOpen : Bool
    , content : String
    , tone : AccordionTone
    }


accordionToneToString : AccordionTone -> String
accordionToneToString tone =
    case tone of
        AccordionDark ->
            "dark"

        AccordionBase ->
            "base"

        AccordionLight ->
            "light"

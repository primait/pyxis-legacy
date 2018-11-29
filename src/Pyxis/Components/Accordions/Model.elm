module Pyxis.Components.Accordions.Model exposing
    ( Accordion
    , AccordionTone(..)
    , Model
    , Msg(..)
    , accordionToneToClass
    , accordionToneToString
    , initialModel
    )

import Html exposing (..)


type Msg
    = InspectHtml String
    | Toggle String


type alias Model =
    { accordions : List Accordion }


initialModel : Model
initialModel =
    Model
        [ Accordion
            "accordion"
            "Accordion"
            "Lorem ipsum"
            Nothing
            False
            initialAccordionContent
        , Accordion
            "accordion_dark"
            "Accordion Dark"
            "Lorem ipsum"
            (Just AccordionDark)
            False
            initialAccordionContent
        , Accordion
            "accordion_base"
            "Accordion Base"
            "Lorem ipsum"
            (Just AccordionBase)
            False
            initialAccordionContent
        , Accordion
            "accordion_light"
            "Accordion Light"
            "Lorem ipsum"
            (Just AccordionLight)
            False
            initialAccordionContent
        ]


type alias Accordion =
    { slug : String
    , name : String
    , title : String
    , tone : Maybe AccordionTone
    , isOpen : Bool
    , content : List (Html Msg)
    }


initialAccordionContent : List (Html Msg)
initialAccordionContent =
    [ p [] [ text "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo." ]
    , p [] [ text "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt." ]
    ]


type AccordionTone
    = AccordionDark
    | AccordionBase
    | AccordionLight


accordionToneToString : AccordionTone -> String
accordionToneToString tone =
    case tone of
        AccordionDark ->
            "dark"

        AccordionBase ->
            "base"

        AccordionLight ->
            "light"


accordionToneToClass : AccordionTone -> String
accordionToneToClass tone =
    case tone of
        AccordionDark ->
            "a-accordion--dark"

        AccordionBase ->
            "a-accordion--base"

        AccordionLight ->
            "a-accordion--light"

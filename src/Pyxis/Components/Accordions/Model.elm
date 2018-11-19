module Pyxis.Components.Accordions.Model exposing
    ( Accordion
    , Model
    , Msg(..)
    , accordionBase
    , accordionDark
    , accordionLight
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
        [ accordionLight
        , accordionBase
        , accordionDark
        ]


accordionLight : Accordion
accordionLight =
    Accordion "a_1" "accordion light" False "bla bla" "light"


accordionBase : Accordion
accordionBase =
    Accordion "a_2" "accordion base" False "bla bla" "base"


accordionDark : Accordion
accordionDark =
    Accordion "a_3" "accordion dark" False "bla bla" "dark"


type alias Accordion =
    { slug : String
    , name : String
    , isOpen : Bool
    , content : String
    , tone : String
    }

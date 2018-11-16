module Pyxis.Components.Accordions.Model exposing
    ( Accordion
    , Model
    , Msg(..)
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
        [ Accordion "a_1" "accordion1" False "bla bla" "light"
        , Accordion "a_2" "accordion2" False "bla bla" "dark"
        , Accordion "a_3" "accordion3" False "bla bla" "base"
        ]


type alias Accordion =
    { slug : String
    , name : String
    , isOpen : Bool
    , content : String
    , tone : String
    }

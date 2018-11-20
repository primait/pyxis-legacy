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
        [ Accordion "a_1" "accordion" False "Contenuto accordion" ""
        , Accordion "a_2" "accordion dark" False "Contenuto accordion" "dark"
        , Accordion "a_3" "accordion base" False "Contenuto accordion" "base"
        , Accordion "a_4" "accordion light" False "Contenuto accordion" "light"
        ]


type alias Accordion =
    { slug : String
    , name : String
    , isOpen : Bool
    , content : String
    , tone : String
    }

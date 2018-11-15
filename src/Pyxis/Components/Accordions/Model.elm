module Pyxis.Components.Accordions.Model exposing
    ( Model
    , Msg(..)
    , initialModel
    )


type Msg
    = InspectHtml String
    | Toggle


type alias Model =
    { isAccordionOpen : Bool }


initialModel : Model
initialModel =
    Model
        False

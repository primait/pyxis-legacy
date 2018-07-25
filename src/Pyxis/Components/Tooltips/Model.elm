module Pyxis.Components.Tooltips.Model
    exposing
        ( Model
        , Msg(..)
        , initialModel
        )

import Http


type Msg
    = InspectHtml String


type alias Model =
    {}


initialModel : Model
initialModel =
    Model

module Pyxis.Components.Loader.Model exposing
    ( Model
    , Msg(..)
    , initialModel
    )

import Http


type Msg
    = FetchTemplate (Result Http.Error String)
    | InspectHtml String


type alias Model =
    { template : Maybe String
    }


initialModel : Model
initialModel =
    Model Nothing

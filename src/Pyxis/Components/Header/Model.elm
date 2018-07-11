module Pyxis.Components.Header.Model
    exposing
        ( Model
        , Msg(..)
        , initialModel
        )

import Http


type Msg
    = FetchTemplate (Result Http.Error String)


type alias Model =
    { template : Maybe String
    }


initialModel : Model
initialModel =
    Model Nothing

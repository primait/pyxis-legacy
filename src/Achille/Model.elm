module Achille.Model
    exposing
        ( AppStatus(..)
        , Model
        , Msg(..)
        , initialModel
        )


type Msg
    = None


type alias Model =
    { status : AppStatus
    }


initialModel : Model
initialModel =
    Model
        AppReady


type AppStatus
    = AppReady

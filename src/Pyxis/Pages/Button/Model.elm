module Pyxis.Pages.Button.Model exposing (Model, Msg(..), initialModel)


type Msg
    = Click
    | DoubleClick


type alias Model =
    { buttons : List Button
    }


initialModel : Model
initialModel =
    { buttons =
        [ Primary
        , Secondary
        , Loading
        ]
    }


type Button
    = Primary
    | Secondary
    | Loading

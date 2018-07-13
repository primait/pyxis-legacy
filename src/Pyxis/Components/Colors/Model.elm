module Pyxis.Components.Colors.Model
    exposing
        ( Color
        , ColorTone(..)
        , Model
        , Msg(..)
        , colorToneToString
        , initialModel
        )


type Msg
    = PickTone Color ColorTone


type alias Model =
    { colors : List Color
    }


initialModel : Model
initialModel =
    Model
        [ Color "purple" [ Light, Base, Dark ]
        , Color "green" [ Light, Base, Dark ]
        , Color "grey" [ Light, Base, Dark ]
        , Color "blue" [ Base, Dark ]
        , Color "red" [ Base ]
        , Color "white" [ Base ]
        , Color "yellow" [ Base ]
        ]


type alias Color =
    { name : String
    , tones : List ColorTone
    }


type ColorTone
    = Light
    | Base
    | Dark


colorToneToString : ColorTone -> String
colorToneToString tone =
    case tone of
        Light ->
            "light"

        Base ->
            "base"

        Dark ->
            "dark"

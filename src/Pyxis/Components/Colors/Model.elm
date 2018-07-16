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
        [ Color "brand" [ Light, Base, Dark ]
        , Color "green" [ Light, Base, Dark ]
        , Color "grey" [ Light, Base, Dark ]
        , Color "background" [ Base, Dark ]
        , Color "background-alt" [ Base, Dark ]
        , Color "action" [ Base, Dark ]
        , Color "error" [ Base ]
        , Color "alert" [ Base ]
        , Color "white" [ Base ]
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

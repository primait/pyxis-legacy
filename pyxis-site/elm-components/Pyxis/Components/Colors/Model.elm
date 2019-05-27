module Pyxis.Components.Colors.Model exposing
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
        , Color "brandAlt" [ Light, Base, Dark ]
        , Color "shape" [ Light, Base, Dark ]
        , Color "text" [ Light, Base, Dark ]
        , Color "textAlt" [ Light, Base, Dark ]
        , Color "background" [ Base, Dark ]
        , Color "backgroundAlt" [ Light, Base, Dark ]
        , Color "action" [ Base, Dark ]
        , Color "error" [ Base ]
        , Color "alert" [ Base ]
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
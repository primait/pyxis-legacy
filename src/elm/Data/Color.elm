module Data.Color exposing (..)

import Hex


type alias RGBA =
    { r : Int
    , g : Int
    , b : Int
    , a : Float
    }


rgbaToHex : RGBA -> String
rgbaToHex { r, g, b } =
    "#"
        ++ String.padLeft 2 '0' (Hex.toString r)
        ++ String.padLeft 2 '0' (Hex.toString g)
        ++ String.padLeft 2 '0' (Hex.toString b)


rgbaToString : RGBA -> String
rgbaToString { r, g, b, a } =
    "rgba("
        ++ String.fromInt r
        ++ ", "
        ++ String.fromInt g
        ++ ", "
        ++ String.fromInt b
        ++ ", "
        ++ String.fromFloat a
        ++ ")"


type alias Color =
    { name : String
    , color : RGBA
    , info : String
    }


institutionalColors : List Color
institutionalColors =
    [ { name = "Color 1"
      , color = RGBA 0x9D 0x00 0xC1 1.0
      , info = "/"
      }
    , { name = "Color 2"
      , color = RGBA 0xD3 0x1F 0xD9 1.0
      , info = "/"
      }
    , { name = "Color 3"
      , color = RGBA 0x00 0xBA 0xA8 1.0
      , info = "/"
      }
    , { name = "Color 4"
      , color = RGBA 0xDF 0xDF 0xDF 1.0
      , info = "/"
      }
    , { name = "Color 5"
      , color = RGBA 0x4C 0x58 0x69 1.0
      , info = "/"
      }
    , { name = "Color 6"
      , color = RGBA 0x00 0xD4 0xA5 1.0
      , info = "/"
      }
    ]


colorsPalette : List ( String, List Color )
colorsPalette =
    [ ( "Brand", brandColors )
    , ( "BrandAlt", brandAltColors )
    , ( "Shape", shapeColors )
    , ( "Text", textColors )
    , ( "TextAlt", textAltColors )
    , ( "Background", backgroundColors )
    , ( "BackgroundAlt", backgroundAltColors )
    , ( "Action", actionColors )
    , ( "Error", errorColors )
    , ( "Alert", alertColors )
    ]


brandColors : List Color
brandColors =
    [ { name = "Light"
      , color = RGBA 0xB9 0x67 0xD9 1.0
      , info = ""
      }
    , { name = "Base"
      , color = RGBA 0x83 0x34 0xC2 1.0
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 0x72 0x30 0xAC 1.0
      , info = ""
      }
    ]


brandAltColors : List Color
brandAltColors =
    [ { name = "Light"
      , color = RGBA 0xED 0xF9 0xF7 1.0
      , info = ""
      }
    , { name = "Base"
      , color = RGBA 0x1D 0xB1 0xAA 1.0
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 0x1B 0xA4 0x9D 1.0
      , info = ""
      }
    ]


shapeColors : List Color
shapeColors =
    [ { name = "Light"
      , color = RGBA 0xF7 0xF7 0xF7 1.0
      , info = ""
      }
    , { name = "Base"
      , color = RGBA 0xE0 0xE0 0xE0 1.0
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 0x4D 0x59 0x69 1.0
      , info = ""
      }
    ]


textColors : List Color
textColors =
    [ { name = "Light"
      , color = RGBA 0xE0 0xE0 0xE0 1.0
      , info = ""
      }
    , { name = "Base"
      , color = RGBA 0x7E 0x88 0x90 1.0
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 0x4D 0x59 0x69 1.0
      , info = ""
      }
    ]


textAltColors : List Color
textAltColors =
    [ { name = "Light"
      , color = RGBA 0xFF 0xFF 0xFF 1.0
      , info = ""
      }
    , { name = "Base"
      , color = RGBA 255 255 255 0.5
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 255 255 255 0.3
      , info = ""
      }
    ]


backgroundColors : List Color
backgroundColors =
    [ { name = "Base"
      , color = RGBA 0xFF 0xFF 0xFF 1.0
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 0xF7 0xF7 0xF7 1.0
      , info = ""
      }
    ]


backgroundAltColors : List Color
backgroundAltColors =
    [ { name = "Light"
      , color = RGBA 0x3C 0x43 0x55 1.0
      , info = ""
      }
    , { name = "Base"
      , color = RGBA 0x34 0x3A 0x4B 1.0
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 0x1E 0x23 0x31 1.0
      , info = ""
      }
    ]


actionColors : List Color
actionColors =
    [ { name = "Base"
      , color = RGBA 0x21 0xC7 0xA7 1.0
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 0x1D 0xB3 0x96 1.0
      , info = ""
      }
    ]


errorColors : List Color
errorColors =
    [ { name = "Light"
      , color = RGBA 0xFF 0xEC 0xEA 1.0
      , info = ""
      }
    , { name = "Base"
      , color = RGBA 0xE7 0x4C 0x3C 1.0
      , info = ""
      }
    ]


alertColors : List Color
alertColors =
    [ { name = "Light"
      , color = RGBA 0xFE 0xF8 0xE5 1.0
      , info = ""
      }
    , { name = "Base"
      , color = RGBA 0xF7 0xDA 0x7E 1.0
      , info = ""
      }
    , { name = "Dark"
      , color = RGBA 0xF7 0xB9 0x00 1.0
      , info = ""
      }
    ]

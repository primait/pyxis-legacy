module Pyxis.Model.Style.Colors exposing
    ( Color(..)
    , Model
    , Msg(..)
    , PyxisColor
    , Variant
    , base
    , colorToLabel
    , dark
    , initialModel
    , light
    , pyxisColorToHexRGB
    , pyxisColorToLabel
    , variantToLabel
    )


type Msg
    = CopyToClipboard PyxisColor
    | CopyAcknowledgement
    | UnsetColorCopied
    | SmoothScroll String
    | NoOp


type alias Model =
    { colors : List PyxisColor
    , colorCopied : Bool
    }


initialModel : Model
initialModel =
    { colors =
        [ Action
        , Alert
        , Background
        , BackgroundAlt
        , Brand
        , BrandAlt
        , Error
        , Shape
        , Text
        , TextAlt
        ]
            |> List.map (\c -> [ base c, dark c, light c ])
            |> List.concat
    , colorCopied = False
    }


type Color
    = Action
    | Alert
    | Background
    | BackgroundAlt
    | Brand
    | BrandAlt
    | Error
    | Shape
    | Text
    | TextAlt


type alias PyxisColor =
    { variant : Variant, color : Color }


type Variant
    = Light
    | Base
    | Dark


dark : Color -> PyxisColor
dark =
    PyxisColor Dark


light : Color -> PyxisColor
light =
    PyxisColor Light


base : Color -> PyxisColor
base =
    PyxisColor Base


pyxisColorToHexRGB : PyxisColor -> String
pyxisColorToHexRGB { color, variant } =
    case ( color, variant ) of
        ( Brand, Base ) ->
            "#8334c2"

        ( Brand, Dark ) ->
            "#7230ac"

        ( Brand, Light ) ->
            "#b967d9"

        ( BrandAlt, Base ) ->
            "#1db1aa"

        ( BrandAlt, Dark ) ->
            "#1ba49d"

        ( BrandAlt, Light ) ->
            "#edf9f7"

        ( Shape, Base ) ->
            "#e0e0e0"

        ( Shape, Dark ) ->
            "#4d5969"

        ( Shape, Light ) ->
            "#f7f7f7"

        ( Text, Base ) ->
            "#7e8890"

        ( Text, Dark ) ->
            "#4d5969"

        ( Text, Light ) ->
            "#e0e0e0"

        ( TextAlt, Base ) ->
            "rgba(255, 255, 255, 0.5)"

        ( TextAlt, Dark ) ->
            "rgba(255, 255, 255, 0.3)"

        ( TextAlt, Light ) ->
            "#ffffff"

        ( Background, Base ) ->
            "#ffffff"

        ( Background, Dark ) ->
            "#f7f7f7"

        ( BackgroundAlt, Light ) ->
            "#3c4355"

        ( BackgroundAlt, Base ) ->
            "#343a4b"

        ( BackgroundAlt, Dark ) ->
            "#1e2331"

        ( Action, Base ) ->
            "#21c7a7"

        ( Action, Dark ) ->
            "#1db396"

        ( Error, Base ) ->
            "#e74c3c"

        ( Error, Light ) ->
            "#ffecea"

        ( Alert, Base ) ->
            "#f7da7e"

        ( Alert, Dark ) ->
            "#f7b900"

        ( Alert, Light ) ->
            "#fef8e5"

        _ ->
            "#aaaaaa"


pyxisColorToLabel : PyxisColor -> String
pyxisColorToLabel { color, variant } =
    colorToLabel color ++ " " ++ variantToLabel variant


colorToLabel : Color -> String
colorToLabel color =
    case color of
        Action ->
            "Action"

        Alert ->
            "Alert"

        Background ->
            "Background"

        BackgroundAlt ->
            "Background Alt"

        Brand ->
            "Brand"

        BrandAlt ->
            "Brand Alt"

        Error ->
            "Error"

        Shape ->
            "Shape"

        Text ->
            "Text"

        TextAlt ->
            "Text Alt"


variantToLabel : Variant -> String
variantToLabel variant =
    case variant of
        Light ->
            "Light"

        Base ->
            "Base"

        Dark ->
            "Dark"

module Pyxis.Pages.Colors exposing
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
    , update
    , variantToLabel
    , view
    )

import Html exposing (Html, article, div, h1, h2, hr, li, p, section, span, text, ul)
import Html.Attributes exposing (class, classList, id, style)
import Html.Events exposing (onClick)
import Pyxis.PageHeader as PageHeader exposing (PageHeader)
import Pyxis.Ports
import Pyxis.UpdateHelpers as UH
import SmoothScroll exposing (scrollTo)
import Task


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CopyToClipboard pyxisColor ->
            model
                |> updateColorCopied True
                |> UH.withCmds
                    [ Pyxis.Ports.copyToClipboard (pyxisColorToHexRGB pyxisColor)
                    ]

        CopyAcknowledgement ->
            model
                |> updateColorCopied True
                |> UH.withCmds
                    [ UH.delay 50 UnsetColorCopied
                    ]

        UnsetColorCopied ->
            model
                |> updateColorCopied False
                |> UH.withoutCmds

        SmoothScroll id ->
            model
                |> UH.withCmds [ Task.attempt (always NoOp) (scrollTo id) ]

        NoOp ->
            model
                |> UH.withoutCmds


updateColorCopied : Bool -> Model -> Model
updateColorCopied bool model =
    { model | colorCopied = bool }


view : Model -> Html Msg
view model =
    div [ class "pyxis__content__colors" ] [ renderColors model ]


renderColors : Model -> Html Msg
renderColors model =
    article [ class "pyxis__content__colors__section" ]
        [ PageHeader.view colorsHead
        , section [ class "colors-section-institutional", id "colors-section-institutional" ]
            [ h2 [] [ text "I colori istituzionali" ]
            , p [ class "c-text-base" ] [ text "Rispetta sempre il set di colori ufficiale in tutte le situazioni in cui è il nostro brand a parlare. Puoi copiare gli esadecimali di riferimento direttamente da qui, oppure utilizzare le specifiche Pantone." ]
            ]
        , section []
            [ h2 [ class "colors-section-colors", id "colors-section-colors" ]
                [ text "I colori di Prima.it" ]
            , p [ class "c-text-base" ] [ text "Qui puoi trovare la palette completa dei colori che utilizziamo su Prima.it. Fai sempre attenzione ad applicarli in modo corretto, copiando gli esadecimali di riferimento o verificando le specifiche RGBA." ]
            ]
        , ul
            [ class "pyxis__content__colors__section__list"
            ]
            (List.map (renderColor model.colorCopied) model.colors)
        ]


colorsHead : PageHeader Msg
colorsHead =
    { title = "Colors"
    , subtitle = "In questa sezione puoi trovare palette ufficiali e specifiche di utilizzo dei colori istituzionali."
    , links =
        [ { label = "I colori istituzionali", clickMsg = SmoothScroll "colors-section-institutional" }
        , { label = "I colori di Prima.it", clickMsg = SmoothScroll "colors-section-colors" }
        ]
    }


renderColor : Bool -> PyxisColor -> Html Msg
renderColor colorCopied ({ color, variant } as pyxisColor) =
    li
        [ classList [ ( "pyxis__content__colors__section__list__item", True ), ( "colorCopied", colorCopied ) ] ]
        [ renderSample pyxisColor
        , div
            [ class "pyxis__content__colors__section__list__item__body" ]
            [ renderName color
            , renderVariant variant
            , renderHexRGB pyxisColor
            ]
        ]


renderSample : PyxisColor -> Html Msg
renderSample pyxisColor =
    div
        [ class "pyxis__content__colors__section__list__item__sample"
        , style "background-color" (pyxisColorToHexRGB pyxisColor)
        ]
        []


renderName : Color -> Html Msg
renderName color =
    span [ class "pyxis__content__colors__section__list__item__name" ] [ text <| colorToLabel color ]


renderVariant : Variant -> Html Msg
renderVariant variant =
    span [ class "pyxis__content__colors__section__list__item__variant" ] [ text <| variantToLabel variant ]


renderHexRGB : PyxisColor -> Html Msg
renderHexRGB pyxisColor =
    div
        [ class "pyxis__content__colors__section__list__item__copyable"
        , onClick (CopyToClipboard pyxisColor)
        ]
        [ span [ class "pyxis__content__colors__section__list__item__copyable__text" ] [ text (pyxisColorToHexRGB pyxisColor) ]
        , span [ class "pyxis__content__colors__section__list__item__copyable__icon icon-sheet" ] []
        ]


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

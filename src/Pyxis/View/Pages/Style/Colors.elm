module Pyxis.View.Pages.Style.Colors exposing (..)

import Html exposing (Html, article, div, h1, h2, hr, li, p, section, span, text, ul)
import Html.Attributes exposing (class, classList, id, style)
import Html.Events exposing (onClick)
import Pyxis.Model.Style.Colors as Colors exposing (Color, Model, PyxisColor, pyxisColorToHexRGB)
import Pyxis.PageHeader as PageHeader exposing (PageHeader)


view : Colors.Model -> Html Colors.Msg
view model =
    div [ class "pyxis__content__colors" ] [ renderColors model ]


renderColors : Colors.Model -> Html Colors.Msg
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


colorsHead : PageHeader Colors.Msg
colorsHead =
    { title = "Colors"
    , subtitle = "In questa sezione puoi trovare palette ufficiali e specifiche di utilizzo dei colori istituzionali."
    , links =
        [ { label = "I colori istituzionali", clickMsg = Colors.SmoothScroll "colors-section-institutional" }
        , { label = "I colori di Prima.it", clickMsg = Colors.SmoothScroll "colors-section-colors" }
        ]
    }


renderColor : Bool -> Colors.PyxisColor -> Html Colors.Msg
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


renderSample : Colors.PyxisColor -> Html Colors.Msg
renderSample pyxisColor =
    div
        [ class "pyxis__content__colors__section__list__item__sample"
        , style "background-color" (pyxisColorToHexRGB pyxisColor)
        ]
        []


renderName : Colors.Color -> Html Colors.Msg
renderName color =
    span [ class "pyxis__content__colors__section__list__item__name" ] [ text <| Colors.colorToLabel color ]


renderVariant : Colors.Variant -> Html Colors.Msg
renderVariant variant =
    span [ class "pyxis__content__colors__section__list__item__variant" ] [ text <| Colors.variantToLabel variant ]


renderHexRGB : Colors.PyxisColor -> Html Colors.Msg
renderHexRGB pyxisColor =
    div
        [ class "pyxis__content__colors__section__list__item__copyable"
        , onClick (Colors.CopyToClipboard pyxisColor)
        ]
        [ span [] [ text (pyxisColorToHexRGB pyxisColor) ]
        , span [ class "icon-sheet" ] []
        ]

module Pyxis.View.Pages.Style.Logo exposing (..)

import Html exposing (Html, a, br, div, h1, h2, h3, h5, li, p, section, span, table, tbody, td, text, th, thead, tr, ul)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Pyxis.Model exposing (Msg(..))
import Pyxis.Model.Route as Route
import Pyxis.Model.Style.Colors as Colors exposing (Color, PyxisColor, pyxisColorToHexRGB)
import Pyxis.PageHead as PageHead exposing (PageHead)


view : Html Msg
view =
    div [ class "pyxis__content__colors" ] [ renderLogoPage ]


renderLogoPage : Html Msg
renderLogoPage =
    section
        [ class "pyxis__content__colors__section"
        ]
        [ PageHead.view logoHead
        , br [] []
        , renderSectionMeaning
        , renderSectionMark
        , renderSectionRespectArea
        , renderSectionColorsAndBackground
        , renderSectionDownloads
        , renderSectionPrimaBlackLogos
        , renderSectionPrimaCafeLogos
        ]


logoHead : PageHead Msg
logoHead =
    { title = "Logo"
    , subtitle = "In questa sezione puoi trovare dettagli e declinazioni del marchio Prima, specifiche grafiche e materiali scaricabili in diversi formati."
    , links =
        [ { label = "Il significato", clickMsg = OnRouteChange Route.Logo }
        , { label = "Il marchio", clickMsg = OnRouteChange Route.Logo }
        , { label = "L'area di rispetto", clickMsg = OnRouteChange Route.Logo }
        , { label = "I colori e lo sfondo", clickMsg = OnRouteChange Route.Logo }
        , { label = "Download", clickMsg = OnRouteChange Route.Logo }
        , { label = "Logo Prima Black", clickMsg = OnRouteChange Route.Logo }
        , { label = "Logo Prima Café", clickMsg = OnRouteChange Route.Logo }
        ]
    }


renderSectionMeaning : Html Msg
renderSectionMeaning =
    section
        [-- 1px border, flex
        ]
        [ div
            [-- LEFT, vertically centered
            ]
            [ h2
                []
                [ text "Il significato" ]
            , p [] [ text "Il nostro nome e il nostro marchio raccontano l'obiettivo di diventare la prima fintech europea. La P iniziale include un 1, un dettaglio grafico che sottolinea questo obiettivo e che ci rende riconoscibili." ]
            ]
        , div
            [-- RIGHT, vertically centered
            ]
            [-- Big logo
            ]
        ]


renderSectionMark : Html Msg
renderSectionMark =
    section
        [-- Flex
        ]
        [ div
            []
            [ h2 [] [ text "Il marchio" ]
            , p [] [ text "Il marchio Prima è rappresentato da un logotipo e da un monogramma: il logotipo è realizzato secondo una disposizione vincolata, mentre il monogramma è dato dall'iniziale P in un cerchio pieno. Utilizza logotipo e monogramma rispettando le composizioni proposte, evitando aggiunte testuali o modifiche di colore." ]
            ]
        , div
            []
            [-- Img with logotype and monogram
            ]
        ]


renderSectionRespectArea : Html Msg
renderSectionRespectArea =
    section
        [-- Flex
        ]
        [ div
            []
            [-- Img with logotype and monogram with their respect zone outlined
            ]
        , div
            []
            [ h2 [] [ text "L'area di rispetto" ]
            , p [] [ text "Utilizza il marchio Prima senza interferire con l'area di rispetto, calcolata come puoi vedere in figura: elementi grafici, testi e immagini dovranno sempre restare al di fuori di quest'area per mantenere la giusta distanza dal logo." ]
            ]
        ]


renderSectionColorsAndBackground : Html Msg
renderSectionColorsAndBackground =
    section
        [-- Flex
        ]
        [ div
            [-- Left
            ]
            [ h2 [] [ text "I colori e lo sfondo" ]
            , h3 [] [ text "Font del marchio" ]
            , p [] [ text "Il marchio Prima è pensato in due versioni, in positivo e in negativo. A seconda dello sfondo, utilizza la versione del marchio più adatta, evitando di utilizzare colori diversi da quelli ufficiali." ]
            , h3 [] [ text "I colori del brand" ]
            , p [] [ text "Il font del logo è il Rubrik nelle varianti: Light, Regular, Semibold e Bold" ]
            , div []
                [-- Two color cards
                ]
            ]
        , div
            [-- Right
            ]
            [ div
                []
                [ -- Logotype + Monogram positive image
                  text "Versione positiva"
                ]
            , div
                []
                [ -- Logotype + Monogram negative image
                  text "Versione negativa"
                ]
            ]
        ]


renderSectionDownloads : Html Msg
renderSectionDownloads =
    section
        [-- BG gradient, flex
        ]
        [ h2 [] [ text "Download" ]
        , p [] [ text "Scarica e utilizza logotipi e pittogrammi in PNG, JPG o PDF. Scegli il formato RGB per il web e il formato CMYK per la stampa." ]
        , h3 [] [ text "Formato RGB - Web" ]
        , div
            [-- Flex
            ]
            [-- Downloadable asset cards
            ]
        , h3 [] [ text "Formato CMYK - Print" ]
        , div
            [-- Flex
            ]
            [-- Downloadable asset cards
            ]
        ]


renderSectionPrimaBlackLogos : Html Msg
renderSectionPrimaBlackLogos =
    section []
        [ h2 [] [ text "Loghi Prima Black" ]
        , p [] [ text "Qui puoi trovare i loghi Prima Black in versione positiva e negativa, utilizzabili solo per agenti e broker che collaborano con Prima attraverso Prima Black." ]
        , div
            [-- Flex
            ]
            [ div
                [-- LEFT
                ]
                [ text "Prima Black logotype and monogram positive image"
                , text "Versione positiva"
                ]
            , div
                [-- RIGHT
                ]
                [ text "Prima Black logotype and monogram negative image"
                , text "Versione negativa"
                ]
            ]
        ]


renderSectionPrimaCafeLogos : Html Msg
renderSectionPrimaCafeLogos =
    section []
        [ h2 [] [ text "Loghi Prima Café" ]
        , p [] [ text "Qui puoi trovare i loghi Prima Café, in versione positiva e negativa, utilizzabili solo per il locale Prima Café." ]
        , div
            [-- Flex
            ]
            [ div
                [-- LEFT
                ]
                [ text "Prima Café logotype and monogram positive image"
                , text "Versione positiva"
                ]
            , div
                [-- RIGHT
                ]
                [ text "Prima Café logotype and monogram negative image"
                , text "Versione negativa"
                ]
            ]
        ]

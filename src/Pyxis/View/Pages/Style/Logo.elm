module Pyxis.View.Pages.Style.Logo exposing (..)

import Html exposing (Html, a, br, div, h1, h2, h3, h5, hr, li, p, section, span, table, tbody, td, text, th, thead, tr, ul)
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
    section [ class "pyxis__content__colors__section" ]
        [ PageHead.view logoHead
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
    section [ class "logo-section-meaning" ]
        [ div [ class "logo-section-meaning__text" ]
            [ h2
                []
                [ text "Il significato" ]
            , p [] [ text "Il nostro nome e il nostro marchio raccontano l'obiettivo di diventare la prima fintech europea. La P iniziale include un 1, un dettaglio grafico che sottolinea questo obiettivo e che ci rende riconoscibili." ]
            ]
        , div [ class "logo-section-meaning__image" ] [ text "<Logotype>" ]
        ]


renderSectionMark : Html Msg
renderSectionMark =
    section [ class "logo-section-mark" ]
        [ div [ class "logo-section-mark__text" ]
            [ h2 [] [ text "Il marchio" ]
            , p [] [ text "Il marchio Prima è rappresentato da un logotipo e da un monogramma: il logotipo è realizzato secondo una disposizione vincolata, mentre il monogramma è dato dall'iniziale P in un cerchio pieno. Utilizza logotipo e monogramma rispettando le composizioni proposte, evitando aggiunte testuali o modifiche di colore." ]
            ]
        , div [ class "logo-section-mark__image" ]
            [ text "<Logotype & Monogram>" ]
        ]


renderSectionRespectArea : Html Msg
renderSectionRespectArea =
    section [ class "logo-section-respect" ]
        [ div [ class "logo-section-respect__image" ] [ text "<Respect Area>" ]
        , div [ class "logo-section-respect__text" ]
            [ h2 [] [ text "L'area di rispetto" ]
            , p [] [ text "Utilizza il marchio Prima senza interferire con l'area di rispetto, calcolata come puoi vedere in figura: elementi grafici, testi e immagini dovranno sempre restare al di fuori di quest'area per mantenere la giusta distanza dal logo." ]
            ]
        ]


renderSectionColorsAndBackground : Html Msg
renderSectionColorsAndBackground =
    section [ class "logo-section-colors" ]
        [ div [ class "logo-section-colors__text" ]
            [ h2 [] [ text "I colori e lo sfondo" ]
            , h3 [] [ text "Font del marchio" ]
            , p [] [ text "Il marchio Prima è pensato in due versioni, in positivo e in negativo. A seconda dello sfondo, utilizza la versione del marchio più adatta, evitando di utilizzare colori diversi da quelli ufficiali." ]
            , h3 [] [ text "I colori del brand" ]
            , p [] [ text "Il font del logo è il Rubrik nelle varianti: Light, Regular, Semibold e Bold" ]
            , div []
                [-- Two color cards
                ]
            ]
        , div [ class "logo-section-colors__images" ]
            [ div []
                [ -- Logotype + Monogram positive image
                  text "Positive Logotype & Monogram"
                ]
            , div []
                [ -- Logotype + Monogram negative image
                  text "Negative Logotype & Monogram"
                ]
            ]
        ]


renderSectionDownloads : Html Msg
renderSectionDownloads =
    section [ class "logo-section-downloads" ]
        [ h2 [] [ text "Download" ]
        , p [] [ text "Scarica e utilizza logotipi e pittogrammi in PNG, JPG o PDF. Scegli il formato RGB per il web e il formato CMYK per la stampa." ]
        , h3 [] [ text "Formato RGB - Web" ]
        , div []
            [ text "<Downloadable Assets Cards>"
            ]
        , h3 [] [ text "Formato CMYK - Print" ]
        , div []
            [ text "<Downloadable Assets Cards>"
            ]
        ]


renderSectionPrimaBlackLogos : Html Msg
renderSectionPrimaBlackLogos =
    section [ class "logo-section-black" ]
        [ h2 [] [ text "Loghi Prima Black" ]
        , p [] [ text "Qui puoi trovare i loghi Prima Black in versione positiva e negativa, utilizzabili solo per agenti e broker che collaborano con Prima attraverso Prima Black." ]
        , div [ class "logo-section-black__images" ]
            [ div [ class "logo-section-black__images-positive" ]
                [ text "<Prima Black Positive Logotype & Monogram>"
                , p [] [ text "Versione positiva" ]
                ]
            , div [ class "logo-section-black__images-negative" ]
                [ text "<Prima Black Negative Logotype & Monogram>"
                , p [] [ text "Versione negativa" ]
                ]
            ]
        ]


renderSectionPrimaCafeLogos : Html Msg
renderSectionPrimaCafeLogos =
    section [ class "logo-section-cafe" ]
        [ h2 [] [ text "Loghi Prima Café" ]
        , p [] [ text "Qui puoi trovare i loghi Prima Café, in versione positiva e negativa, utilizzabili solo per il locale Prima Café." ]
        , div [ class "logo-section-cafe__images" ]
            [ div [ class "logo-section-cafe__images-positive" ]
                [ text "<Prima Café Positive Logotype & Monogram>"
                , p [] [ text "Versione positiva" ]
                ]
            , div [ class "logo-section-cafe__images-negative" ]
                [ text "<Prima Café Negative Logotype & Monogram>"
                , p [] [ text "Versione negativa" ]
                ]
            ]
        ]

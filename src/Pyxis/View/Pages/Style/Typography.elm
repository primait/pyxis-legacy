module Pyxis.View.Pages.Style.Typography exposing (..)

import Html exposing (Html, a, br, div, h1, h2, h5, li, p, section, span, table, tbody, td, text, th, thead, tr, ul)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Pyxis.Model exposing (Msg)
import Pyxis.Model.Style.Colors as Colors exposing (Color, PyxisColor, pyxisColorToHexRGB)


view : Html Msg
view =
    div [ class "pyxis__content__colors" ] [ renderTypographyPage ]


renderTypographyPage : Html Msg
renderTypographyPage =
    section
        [ class "pyxis__content__colors__section"
        ]
        [ renderSectionIntroduction
        , br
            [-- 1px visible br
            ]
            []
        , renderSectionFont
        , renderSectionFontWeight
        , renderSectionHeadingStyles
        , renderSectionBodyStyles
        , renderSectionMarkFont
        ]


renderSectionIntroduction : Html Msg
renderSectionIntroduction =
    section
        []
        [ h1 [] [ text "Typography" ]
        , p [] [ text "In questa sezione puoi verificare dimensioni dei caratteri, tipo di font e specifiche di utilizzo." ]
        , div []
            [ a [] [ text "Il font istituzionale" ]
            , a [] [ text "Font weight" ]
            , a [] [ text "Heading style" ]
            , a [] [ text "Body style" ]
            , a [] [ text "Il font del marchio" ]
            ]
        ]


renderSectionFont : Html Msg
renderSectionFont =
    section
        [-- 1px border, flex
        ]
        [ div
            [-- LEFT, vertically centered
            ]
            [ h2
                []
                [ text "Il font istituzionale" ]
            , p [] [ text "Il nostro font istituzionale è Avenir, che utilizziamo con pesi diversi a seconda dei casi. In francese significa \"futuro\": Avenir, infatti, è una versione meno geometrica e razionale del font Futura, molto apprezzato da grafici e architetti per leggibilità e semplicità. Utilizza sempre questo font per tutti i contenuti testuali, a eccezione del marchio." ]
            ]
        , div
            [-- RIGHT, vertically centered
            ]
            [ div
                [-- Flex
                ]
                [ div
                    [-- vertically centered, massive font size
                    ]
                    [ text "Aa" ]
                , div
                    [-- vertically centered, 1px border-left
                    ]
                    [ div [] [ span [] [ text "CATEGORY" ], span [] [ text "Sans-serif" ] ]
                    , div [] [ span [] [ text "CLASSIFICATION" ], span [] [ text "Geometric" ] ]
                    , div [] [ span [] [ text "DESIGNER" ], span [] [ text "Adrian Frutiger" ] ]
                    , div [] [ span [] [ text "FOUNDRY" ], span [] [ text "Linotype GmbH" ] ]
                    , div [] [ span [] [ text "RELEASED" ], span [] [ text "1988" ] ]
                    ]
                ]
            ]
        ]


renderSectionFontWeight : Html Msg
renderSectionFontWeight =
    section
        []
        [ h2 [] [ text "Font Weight" ]
        , table
            []
            [ thead []
                [ tr []
                    [ th [] [ text "NAME" ]
                    , th [] [ text "USE" ]
                    , th [] [ text "CLASSES" ]
                    ]
                ]
            , tbody []
                [ tr []
                    [ td [] [ text "Avenir Book" ]
                    , td [] [ text "usato per i testi" ]
                    , td [] [ text "fw-light" ]
                    ]
                , tr []
                    [ td [] [ text "Avenir Medium" ]
                    , td [] [ text "usato per i link" ]
                    , td [] [ text "fw-medium" ]
                    ]
                , tr []
                    [ td [] [ text "Avenir Heavy" ]
                    , td [] [ text "usato per i titoli e testi bold" ]
                    , td [] [ text "fw-heavy" ]
                    ]
                ]
            ]
        ]


renderSectionHeadingStyles : Html Msg
renderSectionHeadingStyles =
    section
        []
        [ h2 [] [ text "Heading Styles" ]
        , table
            []
            [ thead []
                [ tr []
                    [ th [] [ text "NAME" ]
                    , th [] [ text "ELEMENT" ]
                    , th [] [ span [] [ text "SIZE" ], span [] [ text "XLarge / Large / Medium / Small" ] ]
                    , th [] [ text "TYPEFACE" ]
                    ]
                ]
            , tbody []
                [ tr
                    []
                    [ td [] [ text "Header" ]
                    , td [] [ text "H1" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Heavy" ]
                    ]
                , tr
                    []
                    [ td [] [ text "Header" ]
                    , td [] [ text "H2" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Medium" ]
                    ]
                , tr
                    []
                    [ td [] [ text "Header" ]
                    , td [] [ text "H3" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Medium" ]
                    ]
                , tr
                    []
                    [ td [] [ text "Header" ]
                    , td [] [ text "H4" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Medium" ]
                    ]
                , tr
                    []
                    [ td [] [ text "Header" ]
                    , td [] [ text "H5" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Medium" ]
                    ]
                ]
            ]
        ]


renderSectionBodyStyles : Html Msg
renderSectionBodyStyles =
    section
        []
        [ h2 [] [ text "Body Styles" ]
        , table
            []
            [ thead []
                [ tr []
                    [ th [] [ text "NAME" ]
                    , th [] [ text "ELEMENT" ]
                    , th [] [ span [] [ text "SIZE" ], span [] [ text "XLarge / Large / Medium / Small" ] ]
                    , th [] [ text "TYPEFACE" ]
                    , th [] [ text "L-SPACING" ]
                    , th [] [ text "CASE" ]
                    , th [] [ text "CLASSES" ]
                    ]
                ]
            , tbody []
                [ tr
                    []
                    [ td [] [ text "Text" ]
                    , td [] [ text "XXlarge" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Book" ]
                    , td [] [ text "0px" ]
                    , td [] [ text "Sentence" ]
                    , td [] [ text "fs-xxlarge" ]
                    ]
                , tr
                    []
                    [ td [] [ text "Text" ]
                    , td [] [ text "Xlarge" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Book" ]
                    , td [] [ text "0px" ]
                    , td [] [ text "Sentence" ]
                    , td [] [ text "fs-xlarge" ]
                    ]
                , tr
                    []
                    [ td [] [ text "Text" ]
                    , td [] [ text "large" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Book" ]
                    , td [] [ text "0px" ]
                    , td [] [ text "Sentence" ]
                    , td [] [ text "fs-large" ]
                    ]
                ]
            ]
        ]


renderSectionMarkFont : Html Msg
renderSectionMarkFont =
    section
        [-- BG gradient, flex
        ]
        [ div
            [-- LEFT, vertically centered
            ]
            [ h2
                []
                [ text "Il font del marchio" ]
            , p [] [ text "Il font del logo è il Rubrik nelle varianti: Light, Regular, Semibold e Bold" ]
            ]
        , div
            [-- RIGHT, vertically centered
            ]
            [ div []
                [ div [] [ h5 [] [ text "RUBRIK LIGHT" ], p [] [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK" ] ]
                , div [] [ h5 [] [ text "RUBRIK REGULAR" ], p [] [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK" ] ]
                , div [] [ h5 [] [ text "RUBRIK SEMIBOLD" ], p [] [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK" ] ]
                ]
            ]
        ]

module Pyxis.View.Pages.Style.Typography exposing (Msg, update, view)

import Html exposing (Html, a, br, div, h1, h2, h3, h4, h5, hr, li, p, section, span, table, tbody, td, text, th, thead, tr, ul)
import Html.Attributes exposing (class, id, style)
import Html.Events exposing (onClick)
import Pyxis.Model.Route as Route
import Pyxis.Model.Style.Colors as Colors exposing (Color, PyxisColor, pyxisColorToHexRGB)
import Pyxis.PageHead as PageHead exposing (PageHead)
import SmoothScroll exposing (scrollTo)
import Task


type Msg
    = NoOp
    | SmoothScroll String


view : Html Msg
view =
    div [ class "typography" ] [ renderTypographyPage ]


update : Msg -> Cmd Msg
update msg =
    case msg of
        NoOp ->
            Cmd.none

        SmoothScroll id ->
            Task.attempt (always NoOp) (scrollTo id)


renderTypographyPage : Html Msg
renderTypographyPage =
    section
        [ class "typography-section"
        ]
        [ PageHead.view typographyHead

        -- 1px visible br
        , hr [] []
        , renderSectionFont
        , renderSectionFontWeight
        , renderSectionHeadingStyles
        , renderSectionBodyStyles
        , renderSectionMarkFont
        ]


typographyHead : PageHead Msg
typographyHead =
    { title = "Typography"
    , subtitle = "In questa sezione puoi verificare dimensioni dei caratteri, tipo di font e specifiche di utilizzo."
    , links =
        [ { label = "Il font istituzionale", clickMsg = SmoothScroll "typography-font-section" }
        , { label = "Font weight", clickMsg = SmoothScroll "typography-font-weight-section" }
        , { label = "Heading style", clickMsg = SmoothScroll "typography-heading-styles-section" }
        , { label = "Body style", clickMsg = SmoothScroll "typography-body-styles-section" }
        , { label = "Il font del marchio", clickMsg = SmoothScroll "typography-mark-font-section" }
        ]
    }


renderSectionFont : Html Msg
renderSectionFont =
    -- 1px border, flex
    section
        [ class "inset-section typography-font-section", id "typography-font-section" ]
        [ div [ class "typography-font-section__intro" ]
            -- LEFT, vertically centered
            [ h2
                []
                [ text "Il font istituzionale" ]
            , p []
                [ text "Il nostro font istituzionale è Avenir, che utilizziamo con pesi diversi a seconda dei casi. In francese significa \"futuro\": Avenir, infatti, è una versione meno geometrica e razionale del font Futura, molto apprezzato da grafici e architetti per leggibilità e semplicità. Utilizza sempre questo font per tutti i contenuti testuali, a eccezione del marchio."
                ]
            ]
        , div
            -- vertically centered, massive font size
            [ class "typography-font-section__sample" ]
            [ text "Aa" ]
        , div [ class "typography-font-section__specs" ]
            -- vertically centered, 1px border-left
            [ div [ class "typography-font-section__specs__item" ]
                [ span [ class "typography-font-section__specs__item__label" ] [ text "CATEGORY" ]
                , span [] [ text "Sans-serif" ]
                ]
            , div [ class "typography-font-section__specs__item" ]
                [ span [ class "typography-font-section__specs__item__label" ] [ text "CLASSIFICATION" ]
                , span [] [ text "Geometric" ]
                ]
            , div [ class "typography-font-section__specs__item" ]
                [ span [ class "typography-font-section__specs__item__label" ] [ text "DESIGNER" ]
                , span [] [ text "Adrian Frutiger" ]
                ]
            , div [ class "typography-font-section__specs__item" ]
                [ span [ class "typography-font-section__specs__item__label" ] [ text "FOUNDRY" ]
                , span [] [ text "Linotype GmbH" ]
                ]
            , div [ class "typography-font-section__specs__item" ]
                [ span [ class "typography-font-section__specs__item__label" ] [ text "RELEASED" ]
                , span [] [ text "1988" ]
                ]
            ]
        ]


renderSectionFontWeight : Html Msg
renderSectionFontWeight =
    section
        [ class "typography-font-weight-section", id "typography-font-weight-section" ]
        [ h2 [] [ text "Font Weight" ]
        , table
            [ class "typography-table" ]
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


type alias HeadingsTableCell =
    { text : String
    , attributes : List (Html.Attribute Msg)
    }


type alias HeadingsTableContents =
    { headRow : List (List (Html Msg))
    , bodyRows : List (List HeadingsTableCell)
    }


headingsTableContents : HeadingsTableContents
headingsTableContents =
    { headRow =
        [ [ text "NAME" ]
        , [ text "ELEMENT" ]
        , [ span [ class "fw-heavy" ] [ text "SIZE " ], span [ class "fw-base", class "fs-xsmall" ] [ text "XLarge / Large / Medium / Small" ] ]
        , [ text "TYPEFACE" ]
        ]
    , bodyRows = List.map headingsTableBodyRows (List.range 1 5)
    }


headingsTableBodyRows : Int -> List HeadingsTableCell
headingsTableBodyRows int =
    [ { text = "Header", attributes = [ class ("typography-h" ++ String.fromInt int) ] }
    , { text = "H" ++ String.fromInt int, attributes = [] }
    , { text = "36px / 32px / 25px / 22px", attributes = [] }
    , { text =
            if int == 1 then
                "Avenir Heavy"

            else
                "Avenir Medium"
      , attributes = []
      }
    ]


renderHeadingsTableBodyRow : List HeadingsTableCell -> Html Msg
renderHeadingsTableBodyRow row =
    tr [] (List.map renderHeadingsTableCell row)


renderHeadingsTableCell : HeadingsTableCell -> Html Msg
renderHeadingsTableCell cell =
    td (List.concat [ [], cell.attributes ]) [ text cell.text ]


renderSectionHeadingStyles : Html Msg
renderSectionHeadingStyles =
    section [ class "typography-heading-styles-section", id "typography-heading-styles-section" ]
        [ h2 [] [ text "Heading Styles" ]
        , table [ class "typography-table" ]
            [ thead []
                [ tr
                    []
                    (List.map (th []) headingsTableContents.headRow)
                ]
            , tbody [] (List.map renderHeadingsTableBodyRow headingsTableContents.bodyRows)
            ]
        ]


renderSectionBodyStyles : Html Msg
renderSectionBodyStyles =
    section
        [ class "typography-body-styles-section", id "typography-body-styles-section" ]
        [ h2 [] [ text "Body Styles" ]
        , table
            [ class "typography-table" ]
            [ thead []
                [ tr []
                    [ th [] [ text "NAME" ]
                    , th [] [ text "ELEMENT" ]
                    , th [] [ span [] [ text "SIZE " ], span [] [ text "XLarge / Large / Medium / Small" ] ]
                    , th [] [ text "TYPEFACE" ]
                    , th [] [ text "L-SPACING" ]
                    , th [] [ text "CASE" ]
                    , th [] [ text "CLASSES" ]
                    ]
                ]
            , tbody []
                [ tr
                    []
                    [ td [ class "fs-xxlarge" ] [ text "Text" ]
                    , td [] [ text "XXlarge" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Book" ]
                    , td [] [ text "0px" ]
                    , td [] [ text "Sentence" ]
                    , td [] [ text "fs-xxlarge" ]
                    ]
                , tr
                    []
                    [ td [ class "fs-xlarge" ] [ text "Text" ]
                    , td [] [ text "Xlarge" ]
                    , td [] [ text "36px / 32px / 25px / 22px" ]
                    , td [] [ text "Avenir Book" ]
                    , td [] [ text "0px" ]
                    , td [] [ text "Sentence" ]
                    , td [] [ text "fs-xlarge" ]
                    ]
                , tr
                    []
                    [ td [ class "fs-large" ] [ text "Text" ]
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
    -- BG gradient, flex
    section [ class "typography-mark-font-section", id "typography-mark-font-section" ]
        -- LEFT, vertically centered
        [ div []
            [ h2
                []
                [ text "Il font del marchio" ]
            , p [] [ text "Il font del logo è il Rubrik nelle varianti: Light, Regular, Semibold e Bold" ]
            ]

        -- RIGHT, vertically centered
        , div []
            [ div []
                [ div []
                    [ h5 [] [ text "RUBRIK LIGHT" ]
                    , p [ class "typography-alphabet-sample" ]
                        [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK"
                        ]
                    ]
                , div []
                    [ h5 [] [ text "RUBRIK REGULAR" ]
                    , p [ class "typography-alphabet-sample" ]
                        [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK"
                        ]
                    ]
                , div []
                    [ h5 [] [ text "RUBRIK SEMIBOLD" ]
                    , p [ class "typography-alphabet-sample" ]
                        [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK"
                        ]
                    ]
                ]
            ]
        ]

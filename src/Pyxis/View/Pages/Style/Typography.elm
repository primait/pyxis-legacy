module Pyxis.View.Pages.Style.Typography exposing (Msg, update, view)

import Html exposing (Html, a, article, br, div, h1, h2, h3, h4, h5, hr, li, p, section, span, table, tbody, td, text, th, thead, tr, ul)
import Html.Attributes exposing (class, id, style)
import Html.Events exposing (onClick)
import Prima.Pyxis.Table as Table
import Pyxis.Model.Route as Route
import Pyxis.Model.Style.Colors as Colors exposing (Color, PyxisColor, pyxisColorToHexRGB)
import Pyxis.PageHeader as PageHeader exposing (PageHeader)
import SmoothScroll exposing (scrollTo)
import Task


type Msg
    = NoOp
    | SmoothScroll String


view : Html Msg
view =
    article []
        [ PageHeader.view typographyHead
        , renderSectionFont
        , renderSectionFontWeight
        , renderSectionHeadingStyles
        , renderSectionBodyStyles
        , renderSectionMarkFont
        ]


update : Msg -> Cmd Msg
update msg =
    case msg of
        NoOp ->
            Cmd.none

        SmoothScroll id ->
            Task.attempt (always NoOp) (scrollTo id)


tableState : Table.State
tableState =
    Table.init Nothing Nothing


createHeaders : List String -> List (Table.Header Msg)
createHeaders headers =
    List.map (\h -> Table.header (String.toLower h) [ Html.strong [] [ Html.text h ] ]) headers


createRows : List (List (List (Html Msg))) -> List (Table.Row Msg)
createRows rows =
    List.map (Table.row << createColumns) rows


createColumns : List (List (Html Msg)) -> List (Table.Column Msg)
createColumns columns =
    List.map (Table.columnHtml 1) columns


weightsTableConfig : Table.Config Msg
weightsTableConfig =
    Table.light False (\_ -> NoOp)
        |> Table.withClass "overridden-pyxis-table"
        |> Table.addHeaders (createHeaders weightsTableHeaders)
        |> Table.addRows (createRows weightsTableRows)


weightsTableHeaders : List String
weightsTableHeaders =
    [ "NAME", "USE", "CLASSES" ]


weightsTableRows : List (List (List (Html Msg)))
weightsTableRows =
    [ [ [ span [ class "fw-light" ] [ text "Avenir Book" ] ]
      , [ text "usato per i testi" ]
      , [ text "fw-light" ]
      ]
    , [ [ span [ class "fw-base" ] [ text "Avenir Medium" ] ]
      , [ text "usato per i link" ]
      , [ text "fw-medium" ]
      ]
    , [ [ span [ class "fw-heavy" ] [ text "Avenir Heavy" ] ]
      , [ text "usato per i titoli e testi bold" ]
      , [ text "fw-heavy" ]
      ]
    ]


headingsTableConfig : Table.Config Msg
headingsTableConfig =
    Table.light False (\_ -> NoOp)
        |> Table.withClass "overridden-pyxis-table"
        |> Table.addHeaders (createHeaders headingsTableHeaders)
        |> Table.addRows (createRows headingsTableRows)


headingsTableHeaders : List String
headingsTableHeaders =
    [ "NAME", "ELEMENT", "SIZE", "TYPEFACE" ]


headingsTableRows : List (List (List (Html Msg)))
headingsTableRows =
    [ [ [ h1 [] [ text "Header" ] ]
      , [ text "H1" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Heavy" ]
      ]
    , [ [ h2 [] [ text "Header" ] ]
      , [ text "H2" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Medium" ]
      ]
    , [ [ h3 [] [ text "Header" ] ]
      , [ text "H3" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Medium" ]
      ]
    , [ [ h4 [] [ text "Header" ] ]
      , [ text "H4" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Medium" ]
      ]
    , [ [ h5 [] [ text "Header" ] ]
      , [ text "H5" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Medium" ]
      ]
    ]


sizesTableConfig : Table.Config Msg
sizesTableConfig =
    Table.light False (\_ -> NoOp)
        |> Table.withClass "overridden-pyxis-table"
        |> Table.addHeaders (createHeaders sizesTableHeaders)
        |> Table.addRows (createRows sizesTableRows)


sizesTableHeaders : List String
sizesTableHeaders =
    [ "NAME", "ELEMENT", "SIZE", "TYPEFACE", "L-SPACING", "CASE", "CLASSES" ]


sizesTableRows : List (List (List (Html Msg)))
sizesTableRows =
    [ [ [ span [ class "fs-xxlarge" ] [ text "Text" ] ]
      , [ text "XXlarge" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Book" ]
      , [ text "0px" ]
      , [ text "Sentence" ]
      , [ text "fs-xxlarge" ]
      ]
    , [ [ span [ class "fs-xlarge" ] [ text "Text" ] ]
      , [ text "Xlarge" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Book" ]
      , [ text "0px" ]
      , [ text "Sentence" ]
      , [ text "fs-xlarge" ]
      ]
    , [ [ span [ class "fs-large" ] [ text "Text" ] ]
      , [ text "large" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Book" ]
      , [ text "0px" ]
      , [ text "Sentence" ]
      , [ text "fs-large" ]
      ]
    , [ [ span [ class "fs-medium" ] [ text "Text" ] ]
      , [ text "medium" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Book" ]
      , [ text "0px" ]
      , [ text "Sentence" ]
      , [ text "fs-medium" ]
      ]
    , [ [ span [ class "fs-base" ] [ text "Text" ] ]
      , [ text "base" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Book" ]
      , [ text "0px" ]
      , [ text "Sentence" ]
      , [ text "fs-base" ]
      ]
    , [ [ span [ class "fs-small" ] [ text "Text" ] ]
      , [ text "small" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Book" ]
      , [ text "0px" ]
      , [ text "Sentence" ]
      , [ text "fs-small" ]
      ]
    , [ [ span [ class "fs-xsmall" ] [ text "Text" ] ]
      , [ text "Xsmall" ]
      , [ text "36px / 32px / 25px / 22px" ]
      , [ text "Avenir Book" ]
      , [ text "0px" ]
      , [ text "Sentence" ]
      , [ text "fs-xsmall" ]
      ]
    ]


typographyHead : PageHeader Msg
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
            [ h2 []
                [ text "Il font istituzionale" ]
            , p []
                [ text "Il nostro font istituzionale è Avenir, che utilizziamo con pesi diversi a seconda dei casi. In francese significa \"futuro\": Avenir, infatti, è una versione meno geometrica e razionale del font Futura, molto apprezzato da grafici e architetti per leggibilità e semplicità. Utilizza sempre questo font per tutti i contenuti testuali, a eccezione del marchio."
                ]
            ]
        , div
            -- vertically centered, massive font size
            [ class "typography-font-section__sample" ]
            [ text "Aa" ]
        , div [ class "typography-font-section__specs fs-small" ]
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
        , Table.render tableState weightsTableConfig
        ]


renderSectionHeadingStyles : Html Msg
renderSectionHeadingStyles =
    section [ class "typography-heading-styles-section", id "typography-heading-styles-section" ]
        [ h2 [] [ text "Heading Styles" ]
        , Table.render tableState headingsTableConfig
        ]


renderSectionBodyStyles : Html Msg
renderSectionBodyStyles =
    section
        [ class "typography-body-styles-section", id "typography-body-styles-section" ]
        [ h2 [] [ text "Body Styles" ]
        , Table.render tableState sizesTableConfig
        ]


renderSectionMarkFont : Html Msg
renderSectionMarkFont =
    section [ class "typography-mark-font-section", id "typography-mark-font-section" ]
        [ div []
            -- LEFT, vertically centered
            [ h2 [] [ text "Il font del marchio" ]
            , p [] [ text "Il font del logo è il Rubrik nelle varianti: Light, Regular, Semibold e Bold" ]
            ]
        , div []
            -- RIGHT, vertically centered
            -- TODO: use Rubrik font
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

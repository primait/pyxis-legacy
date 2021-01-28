module Pyxis.Page.Typography exposing (Msg, update, view)

import Html exposing (Html, article, div, h1, h2, h3, h4, h5, p, section, span, text)
import Html.Attributes exposing (class, id)
import Prima.Pyxis.Table as Table
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
        |> Table.addRows (List.map fontSizeToTableRow [ XXLarge, XLarge, Large, Medium, Base, Small, XSmall ])


sizesTableHeaders : List String
sizesTableHeaders =
    [ "NAME", "ELEMENT", "SIZE", "TYPEFACE", "L-SPACING", "CASE", "CLASSES" ]


type FontSize
    = XXLarge
    | XLarge
    | Large
    | Medium
    | Base
    | Small
    | XSmall


fontSizeToTableRow : FontSize -> Table.Row Msg
fontSizeToTableRow fontSize =
    Table.row <|
        List.map (Table.columnHtml 1) <|
            List.map List.singleton
                [ span [ class (fontSizeToCSSClass fontSize) ] [ text "Text" ]
                , text (fontSizeToLabel fontSize)
                , text (fontSizeToSizes fontSize)
                , text (fontSizeToFontFamily fontSize)
                , text (fontSizeToLSpacing fontSize)
                , text (fontSizeToUseCase fontSize)
                , text (fontSizeToCSSClass fontSize)
                ]


fontSizeToCSSClass : FontSize -> String
fontSizeToCSSClass fontSize =
    case fontSize of
        XXLarge ->
            "fs-xxlarge"

        XLarge ->
            "fs-xlarge"

        Large ->
            "fs-large"

        Medium ->
            "fs-medium"

        Base ->
            "fs-base"

        Small ->
            "fs-small"

        XSmall ->
            "fs-xsmall"


fontSizeToLabel : FontSize -> String
fontSizeToLabel fontSize =
    case fontSize of
        XXLarge ->
            "XXLarge"

        XLarge ->
            "XLarge"

        Large ->
            "Large"

        Medium ->
            "Medium"

        Base ->
            "Base"

        Small ->
            "Small"

        XSmall ->
            "XSmall"


fontSizeToSizes : FontSize -> String
fontSizeToSizes _ =
    "36px / 32px / 25px / 22px"


fontSizeToFontFamily : FontSize -> String
fontSizeToFontFamily _ =
    "Avenir Book"


fontSizeToLSpacing : FontSize -> String
fontSizeToLSpacing _ =
    "0px"


fontSizeToUseCase : FontSize -> String
fontSizeToUseCase _ =
    "Sentence"


typographyHead : PageHeader Msg
typographyHead =
    { title = "Typography"
    , subtitle = "In questa sezione puoi verificare dimensioni dei caratteri, tipo di font e specifiche di utilizzo."
    , links =
        [ { label = "Il font istituzionale", clickMsg = SmoothScroll "page-typography-font-section" }
        , { label = "Font weight", clickMsg = SmoothScroll "page-typography-font-weight-section" }
        , { label = "Heading style", clickMsg = SmoothScroll "page-typography-heading-styles-section" }
        , { label = "Body style", clickMsg = SmoothScroll "page-typography-body-styles-section" }
        , { label = "Il font del marchio", clickMsg = SmoothScroll "page-typography-mark-font-section" }
        ]
    }


renderSectionFont : Html Msg
renderSectionFont =
    -- 1px border, flex
    section
        [ class "inset-section page-typography-font-section", id "page-typography-font-section" ]
        [ div [ class "page-typography-font-section__intro" ]
            [ h2 []
                [ text "Il font istituzionale" ]
            , p []
                [ text "Il nostro font istituzionale è Avenir, che utilizziamo con pesi diversi a seconda dei casi. In francese significa \"futuro\": Avenir, infatti, è una versione meno geometrica e razionale del font Futura, molto apprezzato da grafici e architetti per leggibilità e semplicità. Utilizza sempre questo font per tutti i contenuti testuali, a eccezione del marchio."
                ]
            ]
        , div
            [ class "page-typography-font-section__sample" ]
            [ text "Aa" ]
        , div [ class "page-typography-font-section__specs fs-small" ]
            [ div [ class "page-typography-font-section__specs__item" ]
                [ span [ class "page-typography-font-section__specs__item__label" ] [ text "CATEGORY" ]
                , span [] [ text "Sans-serif" ]
                ]
            , div [ class "page-typography-font-section__specs__item" ]
                [ span [ class "page-typography-font-section__specs__item__label" ] [ text "CLASSIFICATION" ]
                , span [] [ text "Geometric" ]
                ]
            , div [ class "page-typography-font-section__specs__item" ]
                [ span [ class "page-typography-font-section__specs__item__label" ] [ text "DESIGNER" ]
                , span [] [ text "Adrian Frutiger" ]
                ]
            , div [ class "page-typography-font-section__specs__item" ]
                [ span [ class "page-typography-font-section__specs__item__label" ] [ text "FOUNDRY" ]
                , span [] [ text "Linotype GmbH" ]
                ]
            , div [ class "page-typography-font-section__specs__item" ]
                [ span [ class "page-typography-font-section__specs__item__label" ] [ text "RELEASED" ]
                , span [] [ text "1988" ]
                ]
            ]
        ]


renderSectionFontWeight : Html Msg
renderSectionFontWeight =
    section
        [ class "page-typography-font-weight-section", id "page-typography-font-weight-section" ]
        [ h2 [] [ text "Font Weight" ]
        , Table.render tableState weightsTableConfig
        ]


renderSectionHeadingStyles : Html Msg
renderSectionHeadingStyles =
    section [ class "page-typography-heading-styles-section", id "page-typography-heading-styles-section" ]
        [ h2 [] [ text "Heading Styles" ]
        , Table.render tableState headingsTableConfig
        ]


renderSectionBodyStyles : Html Msg
renderSectionBodyStyles =
    section
        [ class "page-typography-body-styles-section", id "page-typography-body-styles-section" ]
        [ h2 [] [ text "Body Styles" ]
        , Table.render tableState sizesTableConfig
        ]


renderSectionMarkFont : Html Msg
renderSectionMarkFont =
    section [ class "page-typography-mark-font-section inset-section", id "page-typography-mark-font-section" ]
        [ div []
            [ h2 [] [ text "Il font del marchio" ]
            , p [] [ text "Il font del logo è il Rubrik nelle varianti: Light, Regular, Semibold e Bold" ]
            ]
        , div []
            -- To be done later: use Rubrik font
            [ div []
                [ div []
                    [ h5 [] [ text "RUBRIK LIGHT" ]
                    , p [ class "page-typography-alphabet-sample" ]
                        [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK"
                        ]
                    ]
                , div []
                    [ h5 [] [ text "RUBRIK REGULAR" ]
                    , p [ class "page-typography-alphabet-sample" ]
                        [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK"
                        ]
                    ]
                , div []
                    [ h5 [] [ text "RUBRIK SEMIBOLD" ]
                    , p [ class "page-typography-alphabet-sample" ]
                        [ text "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890RUBRIK"
                        ]
                    ]
                ]
            ]
        ]

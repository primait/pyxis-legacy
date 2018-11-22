module Pyxis.Components.Typography.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers exposing (componentTitle, divider, renderOrNothing)


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Typography" ]
    , divider
    , fontFamily
    , divider
    , fontSizeStatic
    , textDimension
    , divider
    , fontSize
    , divider
    , lineHeight
    , divider
    ]



-- ++ List.map renderText [ h1, h2, h3, h4, p ]


textDimension : Html Msg
textDimension =
    div []
        [ renderText h1 "h1"
        , renderText h2 "h2"
        , renderText h3 "h3"
        , renderText h4 "h4"
        , renderText p "p"
        ]


renderText : (List (Attribute Msg) -> List (Html Msg) -> Html Msg) -> String -> Html Msg
renderText tagName textName =
    tagName [] [ text ("<" ++ textName ++ "> La comodità dell'online, l'assistenza di un'agenzia.") ]


fontFamily : Html Msg
fontFamily =
    div []
        [ h4 [] [ text "font-family" ]
        , p [] [ text "light: ('avenirltstd-book', Helvetica, Verdana, sans-serif)" ]
        , p [] [ text "base: ('avenirltstd-medium', Helvetica, Verdana, sans-serif)" ]
        , p [] [ text "heavy: ('avenirltstd-heavy', Helvetica, Verdana, sans-serif)" ]
        , p [] [ text "monospace: ('Courier New', Courier, monospace)" ]
        ]


fontSizeStatic : Html Msg
fontSizeStatic =
    div []
        [ h4 [] [ text "font-size pagine statiche" ]
        , div
            [ class "pyTypography" ]
            [ pyTypography_row "" "small" "xsmall" "medium" "large" "xlarge"
            , pyTypography_row "root" "12px" "16px" "16px" "16px" "16px"
            , pyTypography_row "xsmall" "0.75rem" "0.75rem" "0.75rem" "0.75rem" "0.75rem"
            , pyTypography_row "small" "0.875rem" "0.875rem" "0.875rem" "0.875rem" "0.875rem"
            , pyTypography_row "medium" "1.125rem" "1.125rem" "1.125rem" "1.125rem" "1.125rem"
            , pyTypography_row "large" "1.375rem" "1.375rem" "1.375rem" "1.375rem" "1.375rem"
            , pyTypography_row "xlarge" "1.5625rem" "1.5625rem" "1.5625rem" "1.5625rem" "1.5625rem"
            , pyTypography_row "xxlarge" "2rem" "2rem" "2rem" "2rem" "2rem"
            ]
        ]


fontSize : Html Msg
fontSize =
    div []
        [ h4 [] [ text "font-size pagine di flusso" ]
        , div
            [ class "pyTypography" ]
            [ pyTypography_row "" "small" "xsmall" "medium" "large" "xlarge"
            , pyTypography_row "root" "14px" "14px" "14px" "14px" "14px"
            , pyTypography_row "xsmall" "0.785rem" "0.785rem" "0.785rem" "0.785rem" "0.785rem"
            , pyTypography_row "small" "0.857rem" "0.857rem" "0.857rem" "0.857rem" "0.857rem"
            , pyTypography_row "base" "1rem" "1rem" "1rem" "1rem" "1rem"
            , pyTypography_row "medium" "1.1428rem" "1.1428rem" "1.1428rem" "1.1428rem" "1.1428rem"
            , pyTypography_row "large" "1.2857rem" "1.2857rem" "1.2857rem" "1.2857rem" "1.2857rem"
            , pyTypography_row "xlarge" "1.4285rem" "1.4285rem" "1.4285rem" "1.4285rem" "1.4285rem"
            , pyTypography_row "xxlarge" "1.8571rem" "1.8571rem" "1.8571rem" "1.8571rem" "1.8571rem"
            ]
        ]


lineHeight : Html Msg
lineHeight =
    div []
        [ h4 [] [ text "lineHeight" ]
        , div
            [ class "pyTypography" ]
            [ pyTypography_row "" "small" "xsmall" "medium" "large" "xlarge"
            , pyTypography_row "root" "0.75rem" "0.75rem" "0.75rem" "0.75rem" "0.75rem"
            , pyTypography_row "xsmall" "1.27rem" "1.27rem" "1.27rem" "1.27rem" "1.27rem"
            , pyTypography_row "small" "0.875rem" "0.875rem" "0.875rem" "0.875rem" "0.875rem"
            , pyTypography_row "medium" "1.849" "1.849" "1.849" "1.849" "1.849"
            , pyTypography_row "large" "1.375rem" "1.375rem" "1.375rem" "1.375rem" "1.375rem"
            ]
        ]


pyTypography_row : String -> String -> String -> String -> String -> String -> Html Msg
pyTypography_row name bXsmall bSmall bMedium bLarge bXlarge =
    div
        [ class "pyTypography_column" ]
        [ div [ class "pyTypography_row" ] [ text name ]
        , div [ class "pyTypography_row" ] [ text bXsmall ]
        , div [ class "pyTypography_row" ] [ text bSmall ]
        , div [ class "pyTypography_row" ] [ text bMedium ]
        , div [ class "pyTypography_row" ] [ text bLarge ]
        , div [ class "pyTypography_row" ] [ text bXlarge ]
        ]

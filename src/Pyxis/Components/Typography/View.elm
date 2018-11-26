module Pyxis.Components.Typography.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        , initialModel
        )
import Pyxis.ViewHelpers exposing (componentTitle, divider, renderHTMLContent, renderOrNothing)


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Typography" ]
    , divider
    , fontFamily
    , divider
    , fontSizeStatic
    , lineHeight
    , textDimension
    , divider
    , fontSizeFlow
    , divider
    ]


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
        , fontFamilyDimension "light" "'avenirltstd-book', Helvetica, Verdana, sans-serif" "light" "200"
        , fontFamilyDimension "base" "'avenirltstd-medium', Helvetica, Verdana, sans-serif" "base" "200"
        , fontFamilyDimension "heavy" "'avenirltstd-heavy', Helvetica, Verdana, sans-serif" "heavy" "200"
        ]


fontFamilyDimension : String -> String -> String -> String -> Html Msg
fontFamilyDimension fontName fontFamily fontStyle fontWeight =
    div [ class "pyTypographyFamily" ]
        [ h3 [] [ text fontName ]
        , div [ class ("pyLetters fw-" ++ fontName) ] [ text "Aa" ]
        , div [ class ("pyAlphabet fw-" ++ fontName) ] (renderHTMLContent "ABCDEFGHIJKLMNOPQRSTUVWXYZ<br/> abcdefghijklmnopqrstuvwxyz<br/> 1234567890(,.;:?!$&*)")
        , div [ class "pyFontFamily" ] (renderHTMLContent ("<span class='c-text-base'>family:</span> " ++ fontFamily ++ "<br/><span class='c-text-base'>style:</span> " ++ fontStyle ++ "<br/><span class='c-text-base'>weight:</span> " ++ fontWeight ++ "<br/>"))
        ]


fontSizeStatic : Html Msg
fontSizeStatic =
    div []
        [ h4 [] [ text "font-size pagine statiche" ]
        , div
            [ class "pyTable" ]
            [ pyTypographyStatic_row "" "Breakpoint xsmall/small" "Breakpoint medium/large" "Breakpoint xlarge"
            , pyTypographyStatic_row "root" "16px" "16px" "16px"
            , pyTypographyStatic_row "base" "0,875rem / 14px" "1rem / 16px" "1,125rem"
            , pyTypographyStatic_row "xsmall" "0,75rem / 12px" "0,75rem / 12px" "0,84rem"
            , pyTypographyStatic_row "small" "0,875rem / px" "0,875rem / 14px" "0,98rem"
            , pyTypographyStatic_row "medium" "1,125rem / px" "1,125rem / 18px" "1,125rem"
            , pyTypographyStatic_row "large" "1,375rem / px" "1,375rem / 22px" "1,265rem"
            , pyTypographyStatic_row "xlarge" "1,5625rem / px" "1,5625rem / 25px" "1,757em"
            , pyTypographyStatic_row "xxlarge" "2rem" "2rem / 32px" "2,25rem"
            ]
        ]


fontSizeFlow : Html Msg
fontSizeFlow =
    div []
        [ h4 [] [ text "font-size pagine di flusso" ]
        , div
            [ class "pyTable" ]
            [ pyTypographyFlow_row "" "Dimension" "Line-height"
            , pyTypographyFlow_row "root" "14px" ""
            , pyTypographyFlow_row "xsmall" "0,785rem / 11px" ""
            , pyTypographyFlow_row "small" "0,857rem / 12px" ""
            , pyTypographyFlow_row "base" "1rem / 14px" ""
            , pyTypographyFlow_row "medium" "1,1428rem / 16px" ""
            , pyTypographyFlow_row "large" "1,2857rem / 18px" ""
            , pyTypographyFlow_row "xlarge" "1,4285rem / 20px" ""
            , pyTypographyFlow_row "xxlarge" "1,8571rem / 26px" ""
            ]
        ]


lineHeight : Html Msg
lineHeight =
    div []
        [ h4 [] [ text "lineHeight" ]
        , div
            [ class "pyTable" ]
            [ pyTypographyStatic_row "" "Breakpoint xsmall/small" "Breakpoint medium/large" "Breakpoint xlarge"
            , pyTypographyStatic_row "base" "0,75rem " "0,75rem" "0,75rem"
            , pyTypographyStatic_row "xsmall" "1,27rem" "1,27rem" "1,27rem"
            , pyTypographyStatic_row "small" "0,875rem" "0,875rem" "0,875rem"
            , pyTypographyStatic_row "medium" "1,849" "1,849" "1,849"
            , pyTypographyStatic_row "large" "1,375rem" "1,375rem" "1,375rem"
            ]
        ]


pyTypographyStatic_row : String -> String -> String -> String -> Html Msg
pyTypographyStatic_row name bXsmall bMedium bXlarge =
    div
        [ class "pyTypography_column" ]
        [ div [ class "pyTypographyStatic_row" ] [ text name ]
        , div [ class "pyTypographyStatic_row" ] [ text bXsmall ]
        , div [ class "pyTypographyStatic_row" ] [ text bMedium ]
        , div [ class "pyTypographyStatic_row" ] [ text bXlarge ]
        ]


pyTypographyFlow_row : String -> String -> String -> Html Msg
pyTypographyFlow_row name dimension lineHeight =
    div
        [ class "pyTypography_column" ]
        [ div [ class "pyTypographyFlow_row" ] [ text name ]
        , div [ class "pyTypographyFlow_row" ] [ text dimension ]
        , div [ class "pyTypographyFlow_row" ] [ text lineHeight ]
        ]

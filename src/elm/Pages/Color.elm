module Pages.Color exposing (view)

import Data.Color as ColorData
import Html exposing (Html, div, h1, h2, p, section)
import Html.Attributes exposing (class, classList, style)
import Model exposing (Model, Msg)



-- VIEW


view : Model -> Html Msg
view ({ translate } as model) =
    div [ class "color-page" ]
        [ h1 []
            [ Html.text <| translate [] "color-page.title" ]
        , p []
            [ Html.text <| translate [] "color-page.introduction" ]
        , Html.hr [] []
        , viewInstitutionalColorsSection model
        , viewPrimaColorsSection model
        ]


viewInstitutionalColorsSection : Model -> Html Msg
viewInstitutionalColorsSection { translate } =
    section [ class "section" ]
        [ h2 []
            [ Html.text <| translate [] "color-page.institutional-colors.title" ]
        , p []
            [ Html.text <| translate [] "color-page.institutional-colors.description" ]
        , div
            [ class "colors-flex-container" ]
            (List.map (viewColorBox True) ColorData.institutionalColors)
        ]


viewPrimaColorsSection : Model -> Html Msg
viewPrimaColorsSection { translate } =
    section [ class "section" ]
        [ h2 []
            [ Html.text <| translate [] "color-page.prima-colors.title" ]
        , p []
            [ Html.text <| translate [] "color-page.prima-colors.description" ]
        , div []
            (ColorData.colorsPalette
                |> List.map (\( title, colors ) -> viewColorsSection title colors)
            )
        ]


viewColorsSection : String -> List ColorData.Color -> Html Msg
viewColorsSection title colors =
    div []
        [ Html.h3 []
            [ Html.text title ]
        , div [ class "colors-grid" ] <|
            List.map
                (viewColorBox False)
                colors
        ]


viewColorBox : Bool -> ColorData.Color -> Html msg
viewColorBox isBig { name, color, info } =
    div
        [ class "color-box"
        , classList [ ( "color-box--big", isBig ) ]
        ]
        [ div
            [ class "color-box__color", style "background-color" (ColorData.rgbaToHex color) ]
            []
        , div
            [ class "color-box__content" ]
            [ Html.p [ class "color-box__title" ]
                [ Html.text name ]
            , Html.p []
                [ Html.text <| ColorData.rgbaToHex color ]
            , Html.p []
                [ Html.text <| ColorData.rgbaToString color ]
            , Html.p []
                [ Html.text info ]
            ]
        ]

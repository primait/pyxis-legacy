module Pyxis.Components.Loader.View exposing (view)

import Html exposing (..)
import Pyxis.Components.Loader.Model
    exposing
        ( Model
        , Msg(..)
        )

import Pyxis.ViewHelpers exposing (componentTitle, divider, renderOrNothing)
import Html.Attributes exposing (classList)
import Svg exposing (Svg, circle, g, path, svg, line)
import Svg.Attributes exposing (cx, cy, d, height, r, strokeLinejoin, strokeMiterlimit, viewBox, width, class, transform, x1, x2, y1, y2 )

import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        , inspectableHtml
        )


view : Model -> List (Html Msg)
view model =
    let
      loader loaderType loaderText =
        div [ class "m-loader" ]
            [ loaderType
            , loaderText
            ]

    in
    [ componentTitle [ text "Loader" ]
    , divider
    , componentShowdown "loader car" "loaderCar" InspectHtml [ loader svgLoader ( textLoader "Ancora qualche secondo ..." "Stiamo elaborando i tuoi dati." ) ]
    , componentShowdown "loader spinner" "loaderSpinner" InspectHtml [ loader ( spinnerLoader "" "" ) ( textLoader "Ancora qualche secondo ..." "Stiamo elaborando i tuoi dati." ) ]
    , componentShowdown "loader spinner borat" "loaderSpinnerBorat" InspectHtml [ loader ( spinnerLoader "" "green" ) ( textLoader "Dati in elaborazione ..." "" ) ]
    , componentShowdown "loader spinner small" "loaderSpinnerSmall" InspectHtml [ loader ( spinnerLoader "small" "" ) ( textLoader "" "" ) ]
    , componentShowdown "loader spinner small borat" "loaderSpinneSmallBorat" InspectHtml [ loader ( spinnerLoader "small" "green" ) ( textLoader "" "" ) ]
    ]


svgLoader : Html Msg
svgLoader =
  svg
    [ width "150"
    , height "50"
    , class "a-loader__car"
    ]
    [ g
      [ class "a-loader__car__group" ]
      [ path
        [ class "a-loader__car__wheel"
        , d "M184.9,106.3c-12.2,0-21.8-9.6-21.8-21.8s9.6-21.8,21.8-21.8c12.2,0,21.8,9.6,21.8,21.8 S197.1,106.3,184.9,106.3z M184.9,71.2c-7.4,0-12.8,5.9-12.8,12.8c0,7.4,5.9,12.8,12.8,12.8c7.4,0,12.8-5.9,12.8-12.8 C198.2,77.1,192.4,71.2,184.9,71.2z M281.2,106.3c-12.2,0-21.8-9.6-21.8-21.8s9.6-21.8,21.8-21.8c12.2,0,21.8,9.6,21.8,21.8 S292.9,106.3,281.2,106.3z M281.2,71.2c-7.4,0-12.8,5.9-12.8,12.8c0,7.4,5.9,12.8,12.8,12.8c7.4,0,12.8-5.9,12.8-12.8 S288.1,71.2,281.2,71.2z"
        ][]
        , path
          [ class "a-loader__car__body"
          , d "M308.8,47.8l-43.6-9c-1.1-0.5-2.7-1.1-3.2-2.1l-17.6-22.9c-2.7-3.7-6.9-5.9-11.2-5.9h-60.6 c-4.3,0-8.5,2.1-11.2,5.3l-28.2,33.5c-3.2,3.7-4.3,9-3.2,13.8l4.8,18.1c1.6,6.4,7.4,10.6,13.8,10.6h17c2.1,0,4.3-2.1,4.3-4.3 c0-2.1-1.6-4.3-4.3-4.3h-17c-2.7,0-4.8-1.6-5.3-4.3l-4.8-18.1c-0.5-2.1,0-4.3,1.1-5.9l28.2-33.5c1.1-1.6,2.7-2.1,4.3-2.1h60.6 c1.6,0,3.2,0.5,4.3,2.1l17.6,22.9c2.1,2.7,5.3,4.8,8.5,5.3l43.6,9c2.7,0.5,4.8,3.2,4.8,5.9v12.2c0,3.2-2.7,5.9-5.9,5.9h-6.4 c-2.1,0-4.3,2.1-4.3,4.3c0,2.1,1.6,4.3,4.3,4.3h6.4c8,0,14.4-6.4,14.9-14.4V62.2C320.6,55.2,315.8,49.4,308.8,47.8z"
          ][]
        , path
          [ class "a-loader__car__body"
          , d "M241.8,40.9c0-2.1-1.6-4.3-4.3-4.3h-69.7c-2.1,0-4.3,2.1-4.3,4.3c0,2.1,1.6,4.3,4.3,4.3h69.7 C239.7,45.1,241.8,43,241.8,40.9z"
          ][]
        , path
          [ class "a-loader__car__body"
          , d "M263.6,80.2h-61.2c-2.1,0-4.3,2.1-4.3,4.3c0,2.1,1.6,4.3,4.3,4.3h61.2c2.1,0,4.3-2.1,4.3-4.3 C267.9,82.4,266.3,80.2,263.6,80.2z"
          ][]
        , line
          [ class "a-loader__car__line a-loader__car__line--top"
          , x1 "28"
          , y1 "46.7"
          , x2 "114.2"
          , y2 "46.7"
          ][]
        , line
          [ class "a-loader__car__line a-loader__car__line--bottom"
          , x1 "13.2"
          , y1 "65.9"
          , x2 "99.4"
          , y2 "65.9"
          ][]
        , line
          [ class "a-loader__car__line a-loader__car__line--middle"
          , x1 "28"
          , y1 "84.5"
          , x2 "114.2"
          , y2 "84.5"
          ][]
      ]
    ]

spinnerLoader : String -> String -> Html Msg
spinnerLoader dimension color  =
        div
            [ classList
                  [ ( "a-loader__spinner", True )
                  , ( "a-loader__spinner--" ++ dimension, False )
                  , ( "a-loader__spinner--" ++ color, False )
                  ]
            ]
            [ ]


textLoader : String -> String -> Html Msg
textLoader title subtitle =
  div [ class "a-loader__text fs-small fw-heavy c-text-dark" ]
      [
        p [ ]
          [ text title]
        , p [ ]
          [ text subtitle ]
      ]

module Pyxis.Components.Accordions.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Html.Events exposing (onClick)
import Pyxis.Components.Accordions.Model
    exposing
        ( Accordion
        , Model
        , Msg(..)
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        )


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Accordions" ]
    , divider
    , componentShowdown "Accordion" "Accordion" InspectHtml [ accordionColor Nothing model.accordions ]
    , componentShowdown "Accordion Dark" "Accordion Dark" InspectHtml [ accordionColor (Just "dark") model.accordions ]
    ]


accordionColor : Maybe String -> List Accordion -> Html Msg
accordionColor accordionStyle accordion =
    div
        [ classList
            [ ( "m-accordion", True )
            , ( "m-accordion--" ++ Maybe.withDefault "" accordionStyle, True )
            ]
        ]
        (List.map accordionItem accordion)


accordionItem : Accordion -> Html Msg
accordionItem { slug, name, isOpen, content } =
    div
        [ classList
            [ ( "a-accordion__item", True )
            , ( "is-open", isOpen )
            ]
        ]
        [ a
            [ onClick (Toggle slug), class "a-accordion__item__toggle a-link--alt fs-xsmall fw-heavy" ]
            [ text name
            , i [ class "a-icon" ] []
            ]
        , div [ class "a-accordion__item__content fs-medium" ]
            [ text content ]
        ]

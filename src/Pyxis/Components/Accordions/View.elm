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
    , componentShowdown "Accordion" "Accordion" InspectHtml (List.map accordion model.accordions "")
    , componentShowdown "Accordion Black" "AccordionBlack" InspectHtml (List.map accordion model.accordions "")
    ]


accordion : Accordion -> String -> Html Msg
accordion accordionColor =
    div
        [ classList
            [ ( "m-accordion", True )
            , ( "m-accordion--" ++ accordionColor, True )
            ]
        ]
        [ accordionListItem accordion ]


accordionListItem : Accordion -> Html Msg
accordionListItem { slug, name, isOpen, content } =
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

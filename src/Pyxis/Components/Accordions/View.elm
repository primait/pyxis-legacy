module Pyxis.Components.Accordions.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Html.Events exposing (onClick)
import Pyxis.Components.Accordions.Model
    exposing
        ( Accordion
        , Model
        , Msg(..)
        , accordionBase
        , accordionDark
        , accordionLight
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        )


view : Model -> List (Html Msg)
view model =
    let
        renderAccordion : Accordion -> List (Html Msg)
        renderAccordion =
            List.singleton << accordionListItem
    in
    [ componentTitle [ text "Accordions" ]
    , divider
    , (componentShowdown "Accordion Light" "Accordionlight" InspectHtml << renderAccordion) accordionLight
    , (componentShowdown "Accordion Base" "AccordionBase" InspectHtml << renderAccordion) accordionBase
    , (componentShowdown "Accordion Dark" "AccordionDark" InspectHtml << renderAccordion) accordionDark
    ]


accordionListItem : Accordion -> Html Msg
accordionListItem { slug, name, isOpen, content, tone } =
    div
        [ classList
            [ ( "a-accordion", True )
            , ( "a-accordion--" ++ tone, True )
            , ( "is-open", isOpen )
            ]
        ]
        [ a
            [ onClick (Toggle slug), class "a-accordion__toggle a-link--alt fs-xsmall fw-heavy" ]
            [ text name
            , i [ class "a-icon" ] []
            ]
        , div [ class "a-accordion__content fs-medium" ]
            [ text content ]
        ]

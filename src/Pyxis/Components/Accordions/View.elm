module Pyxis.Components.Accordions.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Html.Events exposing (onClick)
import Pyxis.Components.Accordions.Model
    exposing
        ( Accordion
        , AccordionTone(..)
        , Model
        , Msg(..)
        , accordionToneToString
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
    ]
        ++ List.map (\({ slug, name } as accordion) -> componentShowdown name slug InspectHtml (List.singleton (accordionList accordion))) model.accordions


accordionList : Accordion -> AccordionTone -> Html Msg
accordionList { slug, name, isOpen, content, tone } =
    div
        [ classList
            [ ( "a-accordion", True )
            , ( "a-accordion--", accordionToneToString tone, True )
            , ( "is-open", isOpen )
            ]
        ]
        [ a
            [ onClick (Toggle slug), class "a-accordion__toggle a-link--alt fs-xsmall fw-heavy" ]
            [ text name
            , i [ class "a-icon" ] []
            ]
        , div [ class "a-accordion__content fs-small" ]
            [ text content ]
        ]

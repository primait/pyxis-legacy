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
        , accordionToneToClass
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
    componentTitle
        [ text "Accordions" ]
        :: List.map
            (\accordionLoop ->
                componentShowdown
                    accordionLoop.name
                    accordionLoop.slug
                    InspectHtml
                    [ renderAccordion accordionLoop ]
            )
            model.accordions


renderAccordion : Accordion -> Html Msg
renderAccordion ({ slug, name, title, isOpen, content } as accordion) =
    div
        [ classList
            ([ ( "a-accordion", True )
             , ( "is-open", isOpen )
             ]
                ++ (Maybe.withDefault []
                        << Maybe.map
                            (\tone ->
                                [ ( accordionToneToClass tone, True ) ]
                            )
                   )
                    accordion.tone
            )
        ]
        [ span
            [ class "a-accordion__toggle a-link--alt fs-xsmall fw-heavy"
            , onClick (Toggle slug)
            ]
            [ text title
            , i [ class "a-icon" ] []
            ]
        , div
            [ class "a-accordion__content fs-small" ]
            content
        ]

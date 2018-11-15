module Pyxis.Components.Accordions.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Html.Events exposing (onClick)
import Pyxis.Components.Accordions.Model
    exposing
        ( Model
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
    , componentShowdown "Accordion" "Accordion" InspectHtml [ accordion Nothing ( "ciao", "bla bla bla" ) ]
    , componentShowdown "Accordion Dark" "AccordionDark" InspectHtml [ accordion (Just "dark") ( "ciao", "bbla bla" ) ]
    ]


accordion : Maybe String -> ( String, String ) -> String -> Html Msg
accordion accordionStyle ( accordionText, accordionCont ) =
    div
        [ classList
            [ ( "m-accordion", True )
            , ( "m-accordion--" ++ Maybe.withDefault "" accordionStyle, True )
            ]
        ]
        (List.map accordionListItem [ ( accordionText, accordionCont ) ])


accordionListItem : ( String, String ) -> Html Msg
accordionListItem ( accordionText, accordionCont ) =
    div
        [ classList
            [ ( "a-accordion__item", True )
            , ( "is-open", isAccordionOpen )
            ]
        ]
        [ a
            [ onClick Toggle, class "a-accordion__item__toggle a-link--alt fs-xsmall fw-heavy" ]
            [ text accordionText
            , i [ class "a-icon" ] []
            ]
        , div [ class "a-accordion__item__content fs-small" ]
            [ text accordionCont ]
        ]

module Pyxis.Components.Accordions.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
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
    , componentShowdown "Accordion" "Accordion" InspectHtml [ accordion Nothing ]
    , componentShowdown "Accordion Dark" "AccordionDark" InspectHtml [ accordion (Just "dark") ]
    ]


accordion : Maybe String -> Html Msg
accordion accordionStyle =
    ul
        [ classList
            [ ( "m-accordion", True )
            , ( "m-accordion--" ++ Maybe.withDefault "" accordionStyle, True )
            ]
        ]
        (List.map accordionListItem [ ( "ciao/", "Ciao" ), ( "ciao/", "Ciao" ) ])


accordionListItem : ( String, String, Int ) -> Html Msg
accordionListItem ( accordionLink, accordionText ) =
    li
        [ class "a-accordion__item" ]
        [ a
            [ href accordionLink, class "a-link" ]
            [ text accordionText
            , i [ class "a-icon" ] []
            ]
        , div [ class "a-accordion__item__content" ] []
        ]

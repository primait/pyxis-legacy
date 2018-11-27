module Pyxis.Components.Containers.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList)
import Pyxis.Components.Containers.Model
    exposing
        ( Container
        , Model
        , Msg(..)
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        , renderHTMLContent
        , renderIf
        )


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Containers" ]
    , divider
    , containerList model.containers
    ]


containerList : List Container -> Html Msg
containerList container =
    div []
        (List.map containerLayout container)


containerLayout : Container -> Html Msg
containerLayout ({ name, dimension, description, breakpoint } as container) =
    let
        canTextBeFluid =
            dimension /= Just "fluid"
    in
    section []
        [ h4 [] [ text name ]
        , div [ class "pyContainers-wrapper" ]
            [ renderIf canTextBeFluid <| containerImg container.dimension container.description
            , div [ class "pyContainers-description" ]
                (renderHTMLContent ("<p class='fw-base'> Il container  " ++ Maybe.withDefault "" dimension ++ " ha una " ++ description ++ "</p><p class='fw-base'>" renderIf canTextBeFluid <| text (" per il breakpoint " ++ breakpoint)))
            ]
        , divider
        ]


containerImg : Maybe String -> String -> Html Msg
containerImg dimension description =
    div
        [ classList
            [ ( "pyContainers", True )
            , ( Maybe.withDefault "" dimension, True )
            ]
        ]
        [ div
            [ class "pyContainer"
            ]
            []
        ]

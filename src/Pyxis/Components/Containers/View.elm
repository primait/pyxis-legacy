module Pyxis.Components.Containers.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
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
        canTextFluid =
            dimension /= Just "fluid"
    in
    section []
        [ h4 [] [ text name ]
        , div [ class "pyContainers-wrapper" ]
            [ renderIf canTextFluid <| containerImg container.dimension
            , div [ class "pyContainers-description" ]
                [ p [ class "fw-base" ]
                    [ text ("<div class='a-container a-container--" ++ Maybe.withDefault "" dimension ++ "'> ...</div>")
                    ]
                , p []
                    [ text (" Il container  " ++ Maybe.withDefault "" dimension ++ " ha una " ++ description)
                    , renderIf canTextFluid <| text (" per il breakpoint " ++ breakpoint)
                    ]
                ]
            ]
        , divider
        ]


containerImg : Maybe String -> Html Msg
containerImg dimension =
    div
        [ classList
            [ ( "pyContainers", True )
            , ( "pyContainers--" ++ Maybe.withDefault "" dimension, True )
            ]
        ]
        [ div
            [ class "pyContainers_definition" ]
            []
        ]

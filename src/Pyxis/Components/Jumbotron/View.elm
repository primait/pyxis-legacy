module Pyxis.Components.Jumbotron.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (alt, attribute, class, classList, src, type_)
import Pyxis.Components.Jumbotron.Model as Model exposing (Image, Jumbotron, Model, Msg(..))
import Pyxis.Helpers exposing (picture)
import Pyxis.ViewHelpers exposing (componentShowdown, componentTitle, divider, renderHTMLContent)


view : Model -> List (Html Msg)
view model =
    [ componentTitle [ text "Jumbotron" ]
    , divider
    ]
        ++ List.map (\j -> componentShowdown "Jumbotron with paragraph" "jumbotronWithParagraph" InspectHtml (renderJumbotron j)) model


renderJumbotron : Jumbotron -> List (Html Msg)
renderJumbotron model =
    [ div [ classList [ ( "o-jumbotron", True ), ( "a-container", True ) ] ]
        [ div [ class "o-jumbotron__wrapper--left" ] <|
            List.append
                [ h1 [ class "o-jumbotron__title" ] [ text model.title ]
                , h2 [ class "o-jumbotron__subtitle" ] [ text model.subtitle ]
                ]
                (Maybe.withDefault [] (Maybe.map renderHTMLContent model.content))
        , div [ class "o-jumbotron__wrapper--right" ] [ renderImage model.image ]
        ]
    ]


renderImage : Maybe Image -> Html Msg
renderImage image =
    case image of
        Just i ->
            picture [ class "o-jumbotron__picture" ]
                [ source [ attribute "srcset" (stripImageSource i ++ ".webp"), type_ "image/webp" ] []
                , source [ attribute "srcset" i, type_ "image/jpeg" ] []
                , img [ class "o-jumbotron__picture__image", src i, alt "alt-placeholder" ] []
                ]

        Nothing ->
            div [] []


stripImageSource : String -> String
stripImageSource original =
    String.fromList (myStrip [] (String.toList original))


myStrip : List Char -> List Char -> List Char
myStrip acc list =
    case list of
        [] ->
            acc

        '.' :: [ 'j', 'p', 'e', 'g' ] ->
            acc

        '.' :: [ 'j', 'p', 'g' ] ->
            acc

        x :: xs ->
            myStrip (acc ++ [ x ]) xs

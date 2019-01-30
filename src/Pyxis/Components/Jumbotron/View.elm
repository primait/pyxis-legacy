module Pyxis.Components.Jumbotron.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (alt, attribute, src, type_)
import Pyxis.Components.Jumbotron.Model exposing (Image, Jumbotron, Model, Msg)
import Pyxis.Helpers exposing (picture)
import Pyxis.ViewHelpers exposing (renderHTMLContent)


view : Model -> List (Html Msg)
view model = List.map renderJumbotron model


renderJumbotron: Jumbotron -> (Html Msg)
renderJumbotron model =
    let
        _ = Debug.log "My model" (Maybe.map renderHTMLContent model.content)
    in
    div []
    <| List.append [
        h1 [ ] [ text model.title ]
        , h2 [ ] [ text model.subtitle ]
        , renderImage model.image
        ] (Maybe.withDefault [] (Maybe.map renderHTMLContent model.content))

renderImage: Maybe Image -> (Html Msg)
renderImage image =
    case image of
        Just i ->
            picture []
            [ source [ attribute "srcset" ( (stripImageSource i.src) ++ ".webp"), type_ "image/webp"] []
            , source [ attribute "srcset" i.src, type_ "image/jpeg"] []
            , img [ src i.src, alt i.alt] []
            ]
        Nothing -> div [] []

stripImageSource: String -> String
stripImageSource original =
    String.fromList (myStrip [] (String.toList original))

myStrip: List (Char) -> List (Char) -> List (Char)
myStrip acc list =
    case list of
        [] -> acc
        '.' :: ['j', 'p', 'e', 'g'] -> acc
        '.' :: ['j', 'p', 'g'] -> acc
        x :: xs -> myStrip (acc ++ [x]) xs

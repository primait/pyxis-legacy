module Pyxis.Components.Typography.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Pyxis.Helpers
    exposing
        ( divider
        , renderOrNothing
        )
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        )


view : Model -> List (Html Msg)
view model =
    let
        renderText : (List (Attribute Msg) -> List (Html Msg) -> Html Msg) -> Html Msg
        renderText tagName =
            tagName [] [ text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor." ]
    in
    [ h2 [ class "pySubtitle" ] [ text "Form components" ]
    , divider
    ]
        ++ (List.intersperse divider
                << List.map renderText
           )
            [ h1, h2, h3, h4, h5, h6, p ]

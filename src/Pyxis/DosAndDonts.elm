module Pyxis.DosAndDonts exposing (..)

import Html exposing (Html, div, li, text, ul)
import Html.Attributes exposing (class)


dosAndDonts : { dos : List String, donts : List String } -> Html msg
dosAndDonts { dos, donts } =
    div [ class "pyxis__dos-and-donts" ]
        [ div [ class "pyxis__dos-and-donts__donts" ]
            [ div [ class "pyxis__dos-and-donts__donts__header" ]
                [ text "DON'T" ]
            , ul [ class "pyxis__dos-and-donts__donts__list" ]
                (List.map (text >> List.singleton >> li [ class "pyxis__dos-and-donts__donts__list__li" ]) donts)
            ]
        , div [ class "pyxis__dos-and-donts__dos" ]
            [ div [ class "pyxis__dos-and-donts__dos__header" ]
                [ text "DO" ]
            , ul [ class "pyxis__dos-and-donts__dos__list" ]
                (List.map (text >> List.singleton >> li [ class "pyxis__dos-and-donts__donts__list__li" ]) dos)
            ]
        ]

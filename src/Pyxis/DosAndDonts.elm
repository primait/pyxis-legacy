module Pyxis.DosAndDonts exposing (..)

import Html exposing (Html, div, li, text, ul)
import Html.Attributes exposing (class)


dosAndDonts : { dos : List String, donts : List String } -> Html msg
dosAndDonts { dos, donts } =
    div [ class "dos-and-donts" ]
        [ div [ class "dos-and-donts__donts" ]
            [ div [ class "dos-and-donts__donts__header" ]
                [ text "DON'T" ]
            , ul [ class "dos-and-donts__donts__ul" ]
                (List.map (text >> List.singleton >> li [ class "dos-and-donts__donts__li" ]) donts)
            ]
        , div [ class "dos-and-donts__dos" ]
            [ div [ class "dos-and-donts__dos__header" ]
                [ text "DO" ]
            , ul [ class "dos-and-donts__dos__ul" ]
                (List.map (text >> List.singleton >> li [ class "dos-and-donts__dos__li" ]) dos)
            ]
        ]

module ViewHelpers exposing (..)

import Html exposing (Html)


viewIf : Bool -> Html msg -> Html msg
viewIf cond el =
    if cond then
        el

    else
        Html.text ""


viewIfElse : Bool -> Html msg -> Html msg -> Html msg
viewIfElse cond elem1 elem2 =
    if cond then
        elem1

    else
        elem2


viewMaybe : Maybe (Html msg) -> Html msg
viewMaybe maybeEl =
    case maybeEl of
        Just el ->
            el

        Nothing ->
            Html.text ""

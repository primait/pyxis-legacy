module Commons.Box exposing (Type(..), bgColorToClass, view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)


type Type
    = Light
    | Gray
    | Gradient
    | Dark


bgColorToClass : Type -> String
bgColorToClass bg =
    case bg of
        Light ->
            ""

        Gray ->
            "box--bg-light"

        Gradient ->
            "box--bg-gradient"

        Dark ->
            "box--bg-dark"


view : Type -> List (Html msg) -> Html msg
view background content =
    div [ class <| "box " ++ bgColorToClass background ]
        content

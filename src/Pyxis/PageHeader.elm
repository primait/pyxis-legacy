module Pyxis.PageHeader exposing (Link, PageHeader, view)

import Html exposing (Html, a, div, h1, header, hr, p, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias PageHeader msg =
    { title : String
    , subtitle : String
    , links : List (Link msg)
    }


type alias Link msg =
    { label : String
    , clickMsg : msg
    }


view : PageHeader msg -> Html msg
view pageHead =
    header [ class "page-head" ]
        [ h1 [ class "page-head__title" ] [ text pageHead.title ]
        , p [ class "page-head__subtitle c-text-base" ] [ text pageHead.subtitle ]
        , linkBar pageHead.links
        , hr [] []
        ]


linkBar : List (Link msg) -> Html msg
linkBar links =
    div [ class "page-head__link-bar" ] (List.map link links)


link : Link msg -> Html msg
link { label, clickMsg } =
    a [ class "page-head__link", onClick clickMsg ] [ span [ class "icon-arrow-dx-button" ] [], text label ]

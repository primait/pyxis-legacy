module Pyxis.PageHead exposing (Link, PageHead, view)

import Html exposing (Html, a, div, h1, p, section, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias PageHead msg =
    { title : String
    , subtitle : String
    , links : List (Link msg)
    }


type alias Link msg =
    { label : String
    , clickMsg : msg
    }


view : PageHead msg -> Html msg
view pageHead =
    section
        [ class "page-head" ]
        [ h1 [ class "page-head__title" ] [ text pageHead.title ]
        , p [ class "page-head__subtitle" ] [ text pageHead.subtitle ]
        , linkBar pageHead.links
        ]


linkBar : List (Link msg) -> Html msg
linkBar links =
    div [] (List.map link links)


link : Link msg -> Html msg
link { label, clickMsg } =
    a [ onClick clickMsg ] [ text label ]

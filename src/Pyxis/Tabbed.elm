module Pyxis.Tabbed exposing (Tab, Tabbed, init, initTab, view)

import Html exposing (Html, div, li, span, text, ul)
import Html.Attributes exposing (classList)
import Html.Events as Events
import List.Extra


type Tabbed msg
    = Tabbed (Config msg)


type alias Config msg =
    { tabs : List (Tab msg)
    , current : String
    , onClick : String -> msg
    }


init : String -> (String -> msg) -> List (Tab msg) -> Tabbed msg
init current onClick tabs =
    Tabbed { current = current, tabs = tabs, onClick = onClick }


type Tab msg
    = Tab (TabConfig msg)


type alias TabConfig msg =
    { slug : String
    , label : String
    , content : Html msg
    }


initTab : String -> String -> Html msg -> Tab msg
initTab slug label content =
    Tab
        { slug = slug
        , label = label
        , content = content
        }


view : Tabbed msg -> Html msg
view (Tabbed config) =
    div []
        [ ul
            []
            (List.map (renderTab config) config.tabs)
        , div
            []
            [ config.tabs
                |> List.Extra.find (\(Tab { slug }) -> slug == config.current)
                |> Maybe.map (\(Tab { content }) -> content)
                |> Maybe.withDefault (text "")
            ]
        ]


renderTab : Config msg -> Tab msg -> Html msg
renderTab { current, onClick } (Tab tabConfig) =
    li
        [ classList [ ( "is-active", current == tabConfig.slug ) ]
        ]
        [ span
            [ Events.onClick (onClick tabConfig.slug) ]
            [ text tabConfig.label ]
        ]

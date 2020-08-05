module Commons.Menu exposing (view)

import Html exposing (Html, a, div, h1, li, nav, text, ul)
import Html.Attributes exposing (class, style)
import Model exposing (Model, Msg)
import Route exposing (Route(..), href)


type alias Menu =
    { label : String
    , route : Route
    }


menu : List Menu
menu =
    [ { label = "Welcome", route = Route.Homepage }
    , { label = "Accordions", route = Route.Accordion }
    , { label = "Buttons", route = Route.Button }
    ]


view : Model -> Html Msg
view model =
    nav [ class "pyxis-sidebar", style "padding" "16px" ]
        [ h1 [ class "pyxis-sidebar__logo" ]
            [ text "Logo" ]
        , ul []
            (menu
                |> List.map
                    (\item ->
                        li []
                            [ a [ href item.route ] [ text item.label ] ]
                    )
            )
        ]

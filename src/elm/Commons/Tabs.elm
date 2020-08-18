module Commons.Tabs exposing (view)

import Array exposing (Array)
import Html exposing (Html, button, div, span, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import ViewHelpers as VH


type alias ViewConfig msg =
    { active : Int
    , tabs :
        Array
            { name : String
            , view : Html msg
            }
    , onTabClick : Int -> msg
    }


view : ViewConfig msg -> Html msg
view { active, tabs, onTabClick } =
    let
        tabView =
            Array.get active tabs
                |> Maybe.map .view
    in
    div
        [ class "tabs" ]
        [ div [ class "tabs__header" ]
            (tabs
                |> Array.toList
                |> List.indexedMap
                    (\i tab ->
                        button
                            [ class "tabs__tab"
                            , classList [ ( "tabs__tab--active", i == active ) ]
                            , onClick (onTabClick i)
                            ]
                            [ span [ class "tabs__tab-label" ] [ text tab.name ] ]
                    )
            )
        , div
            [ class "tabs__content" ]
            [ VH.viewMaybe tabView ]
        ]

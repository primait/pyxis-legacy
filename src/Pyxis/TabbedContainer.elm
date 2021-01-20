module Pyxis.TabbedContainer exposing (State, Tab, init, view)

import Array
import Html exposing (Html, div, li, text, ul)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)


type State
    = State Int


type Msg
    = SetCurrent


type alias Tab msg =
    { content : Html msg
    , label : String
    }


init : State
init =
    State 0


update : Msg -> Int -> State
update msg value =
    case msg of
        SetCurrent ->
            State value


view : (State -> msg) -> State -> List (Tab msg) -> Html msg
view toStateUpdateMsg (State current) tabs =
    div [ class "tabbed-container" ]
        [ ul [ class "tabbed-container__label-container" ]
            (tabs
                |> List.map .label
                |> List.indexedMap Tuple.pair
                |> List.map (renderLabel toStateUpdateMsg current)
            )
        , div [ class "tabbed-container__content-container" ]
            [ tabs
                |> List.map .content
                |> Array.fromList
                |> Array.get current
                |> Maybe.withDefault (text "")
            ]
        ]


renderLabel : (State -> msg) -> Int -> ( Int, String ) -> Html msg
renderLabel toStateUpdateMsg current indexAndLabel =
    let
        ( index, label ) =
            indexAndLabel
    in
    li
        [ classList
            [ ( "tabbed-container__label-container__label", True )
            , ( "tabbed-container__label-container__label__active", index == current )
            ]
        , onClick (toStateUpdateMsg (update SetCurrent index))
        ]
        [ text label
        ]

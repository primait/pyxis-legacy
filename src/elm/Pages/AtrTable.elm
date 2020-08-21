module Pages.AtrTable exposing
    ( Model
    , Msg(..)
    , init
    , update
    , view
    )

import Dict
import Helpers as H
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)
import Prima.Pyxis.AtrTable as AtrTable


type alias Model =
    WithCodeInspectors
        { atrTable : AtrTable.State
        }


init : Model
init =
    { inspectMode = Dict.empty, atrTable = initTable }


initTable : AtrTable.State
initTable =
    let
        isEditable =
            True
    in
    (Tuple.first << (AtrTable.state isEditable << List.map createAtr)) (List.range 2012 2019)


createAtr : Int -> AtrTable.AtrDetail
createAtr year =
    year
        |> AtrTable.atr
        |> AtrTable.paritaria (Just "1")
        |> AtrTable.paritariaMista (Just "1")
        |> AtrTable.paritariaCose (Just "1")
        |> AtrTable.paritariaPersone (Just "1")
        |> AtrTable.principale (Just "1")
        |> AtrTable.principaleMista (Just "1")
        |> AtrTable.principaleCose (Just "1")
        |> AtrTable.principalePersone (Just "1")



-- UPDATE


type Msg
    = NoOp
    | ToggleInspect String Bool
    | UpdateAtrTable AtrTable.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model
                |> H.withoutCmds

        ToggleInspect id isActive ->
            model
                |> ComponentPage.toggleInspect id isActive
                |> H.withoutCmds

        UpdateAtrTable submsg ->
            model
                |> updateTable submsg
                |> H.withoutCmds


updateTable : AtrTable.Msg -> Model -> Model
updateTable msg model =
    let
        ( newState, _, _ ) =
            AtrTable.update msg model.atrTable
    in
    { model | atrTable = newState }



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "atr-table-page" ]
        [ ComponentPage.view
            { title = "Atr-Table"
            , description = ""
            , specs = Nothing
            , sections = []
            }
        , Html.map UpdateAtrTable <| AtrTable.render model.atrTable
        ]

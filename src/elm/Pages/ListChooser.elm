module Pages.ListChooser exposing
    ( Model
    , Msg(..)
    , init
    , update
    , view
    )

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Dict
import Helpers as H
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)
import Prima.Pyxis.ListChooser as PyxisListChooser


type alias Model =
    WithCodeInspectors
        { singleSelectList : PyxisListChooser.State
        , multiSelectList : PyxisListChooser.State
        }


init : Model
init =
    { inspectMode = Dict.empty
    , singleSelectList = initialListState
    , multiSelectList = initialListState
    }


initialListState : PyxisListChooser.State
initialListState =
    PyxisListChooser.init PyxisListChooser.Partial
        |> PyxisListChooser.withItems exampleItems


exampleItems : List PyxisListChooser.ChooserItem
exampleItems =
    List.range 1 5
        |> List.map
            (\index ->
                PyxisListChooser.createItem
                    (String.fromInt index)
                    ("Item " ++ String.fromInt index)
                    False
            )



-- UPDATE


type Msg
    = NoOp
    | ToggleInspect String Bool
    | UpdateSingleSelect PyxisListChooser.Msg
    | UpdateMultiSelect PyxisListChooser.Msg


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

        UpdateSingleSelect submsg ->
            model
                |> updateSingleSelectList submsg
                |> H.withoutCmds

        UpdateMultiSelect submsg ->
            model
                |> updateMultiSelectList submsg
                |> H.withoutCmds


updateSingleSelectList : PyxisListChooser.Msg -> Model -> Model
updateSingleSelectList msg model =
    { model | singleSelectList = PyxisListChooser.update msg baseConfig model.singleSelectList }


updateMultiSelectList : PyxisListChooser.Msg -> Model -> Model
updateMultiSelectList msg model =
    { model | multiSelectList = PyxisListChooser.update msg multiSelectConfig model.multiSelectList }



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "list-chooser-page" ]
        [ ComponentPage.view
            { title = "List Chooser"
            , description = ""
            , specs = Nothing
            , sections = [ mainSection model ]
            }
        ]


mainSection : Model -> ComponentPage.SectionViewConfig Msg
mainSection model =
    { title = ""
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { id = "chooser-1"
            , isCodeVisible = ComponentPage.isInspecting "chooser-1" model
            , boxType = Box.Gray
            , example = """TODO"""
            , label = "single select"
            , onTogglePreview = ToggleInspect
            }
            [ Html.map UpdateSingleSelect <|
                PyxisListChooser.render model.singleSelectList baseConfig
            ]
        , ComponentViewer.view
            { id = "multi-chooser"
            , isCodeVisible = ComponentPage.isInspecting "multi-chooser" model
            , boxType = Box.Gray
            , example = """TODO"""
            , label = "multi select"
            , onTogglePreview = ToggleInspect
            }
            [ Html.map UpdateMultiSelect <|
                PyxisListChooser.render model.multiSelectList multiSelectConfig
            ]
        ]
    }


baseConfig : PyxisListChooser.Config
baseConfig =
    PyxisListChooser.config 3 "View All" "View first 3"


multiSelectConfig : PyxisListChooser.Config
multiSelectConfig =
    baseConfig |> PyxisListChooser.withMultipleSelection True

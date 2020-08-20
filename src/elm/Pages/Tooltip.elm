module Pages.Tooltip exposing
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
import Prima.Pyxis.Tooltip as PyxisTooltip


type alias Model =
    WithCodeInspectors {}


init : Model
init =
    { inspectMode = Dict.empty
    }



-- UPDATE


type Msg
    = NoOp
    | ToggleInspect String Bool


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


tooltipExamples : List (PyxisTooltip.Config Msg)
tooltipExamples =
    [ PyxisTooltip.left [ Html.text "Left" ]
    , PyxisTooltip.right [ Html.text "Right" ]
    , PyxisTooltip.top [ Html.text "Top" ]
    , PyxisTooltip.bottom [ Html.text "Bottom" ]
    ]



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "tooltip-page" ]
        [ ComponentPage.view
            { title = "Tooltip"
            , description = ""
            , specs = Nothing
            , sections = [ sectionConfig model ]
            }
        ]


sectionConfig : Model -> ComponentPage.SectionViewConfig Msg
sectionConfig model =
    { title = "Positioning"
    , suggestions = Nothing
    , content =
        List.indexedMap (viewComponent model) tooltipExamples
    }


viewComponent : Model -> Int -> PyxisTooltip.Config Msg -> Html Msg
viewComponent model index tooltipConfig =
    let
        id =
            String.fromInt index
    in
    ComponentViewer.view
        { id = id
        , isCodeVisible = ComponentPage.isInspecting id model
        , boxType = Box.Gray
        , example = """TODO"""
        , label = ComponentViewer.boxTypeToLabel Box.Light
        , onTogglePreview = ToggleInspect
        }
        [ Html.div [ class "tooltip-example-block" ]
            [ PyxisTooltip.render tooltipConfig ]
        ]

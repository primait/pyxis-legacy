module Pages.Tooltip exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage
import Pages.Tooltip.Model exposing (Model, Msg(..))
import Prima.Pyxis.Tooltip as PyxisTooltip


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
        , boxType = Box.Base
        , example = """TODO"""
        , label = ComponentViewer.boxTypeToLabel Box.Light
        , onTogglePreview = ToggleInspect
        , onCopyCode = CopyToClipboard
        }
        [ Html.div [ class "tooltip-example-block" ]
            [ PyxisTooltip.render tooltipConfig ]
        ]


tooltipExamples : List (PyxisTooltip.Config Msg)
tooltipExamples =
    [ PyxisTooltip.left [ Html.text "Left" ]
    , PyxisTooltip.right [ Html.text "Right" ]
    , PyxisTooltip.top [ Html.text "Top" ]
    , PyxisTooltip.bottom [ Html.text "Bottom" ]
    ]

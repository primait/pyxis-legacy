module Pages.ListChooser exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage
import Pages.ListChooser.Model as M exposing (Model, Msg(..))
import Prima.Pyxis.ListChooser as PyxisListChooser


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
            , boxType = Box.Base
            , example = """TODO"""
            , label = "single select"
            , onTogglePreview = ToggleInspect
            , onCopyCode = CopyToClipboard
            }
            [ Html.map UpdateSingleSelect <|
                PyxisListChooser.render model.singleSelectList M.baseConfig
            ]
        , ComponentViewer.view
            { id = "multi-chooser"
            , isCodeVisible = ComponentPage.isInspecting "multi-chooser" model
            , boxType = Box.Base
            , example = """TODO"""
            , label = "multi select"
            , onTogglePreview = ToggleInspect
            , onCopyCode = CopyToClipboard
            }
            [ Html.map UpdateMultiSelect <|
                PyxisListChooser.render model.multiSelectList M.multiSelectConfig
            ]
        ]
    }

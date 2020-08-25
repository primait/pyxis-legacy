module Pages.Message exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage
import Pages.Message.Model exposing (Model, Msg(..))
import Prima.Pyxis.Message as Message


view : Model -> Html Msg
view model =
    div [ class "message-page" ]
        [ ComponentPage.view
            { title = "Message"
            , description = ""
            , specs = Nothing
            , sections = sectionsConfig messages model
            }
        ]


sectionsConfig : List MessageSectionConfig -> Model -> List (ComponentPage.SectionViewConfig Msg)
sectionsConfig configList model =
    List.map
        (\{ id, title, boxType, config } ->
            { title = title
            , suggestions = Nothing
            , content =
                [ ComponentViewer.view
                    { id = id
                    , isCodeVisible = ComponentPage.isInspecting id model
                    , boxType = boxType
                    , example = """TODO"""
                    , label = ComponentViewer.boxTypeToLabel boxType
                    , onTogglePreview = ToggleInspect
                    , onCopyCode = CopyToClipboard
                    }
                    [ Message.render (config [ text exampleText ])
                    ]
                ]
            }
        )
        configList


type alias MessageSectionConfig =
    { id : String
    , title : String
    , boxType : Box.Type
    , config : List (Html Msg) -> Message.Config Msg
    }


messages : List MessageSectionConfig
messages =
    [ { id = "info"
      , title = "Info"
      , boxType = Box.Light
      , config = Message.info
      }
    , { id = "success"
      , title = "Success"
      , boxType = Box.Light
      , config = Message.success
      }
    , { id = "alert"
      , title = "Alert"
      , boxType = Box.Light
      , config = Message.alert
      }
    , { id = "error"
      , title = "Error"
      , boxType = Box.Light
      , config = Message.error
      }
    , { id = "infoAlt"
      , title = "Info Alt"
      , boxType = Box.Dark
      , config = Message.infoAlt
      }
    , { id = "successAlt"
      , title = "Success Alt"
      , boxType = Box.Dark
      , config = Message.successAlt
      }
    , { id = "alertAlt"
      , title = "Alert Alt"
      , boxType = Box.Dark
      , config = Message.alertAlt
      }
    , { id = "errorAlt"
      , title = "Error Alt"
      , boxType = Box.Dark
      , config = Message.errorAlt
      }
    ]


exampleText : String
exampleText =
    "Lorem ipsum dolor sit amet"

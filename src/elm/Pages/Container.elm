module Pages.Container exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)
import Pages.Container.Model exposing (Model, Msg(..))
import Prima.Pyxis.Container as Container
import Prima.Pyxis.Helpers as PyxisHelpers


view : Model -> Html Msg
view ({ translate } as model) =
    div [ class "container-page" ]
        [ ComponentPage.view
            { title = translate [] "container-page.title"
            , description = translate [] "container-page.description"
            , specs = Nothing
            , sections =
                [ normalContainerSection model
                , fluidContainerSection model
                ]
            }
        ]


normalContainerSection : Model -> ComponentPage.SectionViewConfig Msg
normalContainerSection ({ translate } as model) =
    { title = translate [] "container-page.normal-containers.title"
    , suggestions = Nothing
    , content =
        [ p [] [ Html.text <| translate [] "container-page.normal-containers.description" ]
        , ComponentViewer.view
            { id = "row"
            , isCodeVisible = ComponentPage.isInspecting "row" model
            , onTogglePreview = ToggleInspect
            , boxType = Box.Light
            , label = "row container"
            , example = "TODO"
            }
            [ viewExampleContainer Container.row
            ]
        , ComponentViewer.view
            { id = "column"
            , isCodeVisible = ComponentPage.isInspecting "column" model
            , onTogglePreview = ToggleInspect
            , boxType = Box.Light
            , label = "column container"
            , example = "TODO"
            }
            [ viewExampleContainer Container.column
            ]
        ]
    }


fluidContainerSection : Model -> ComponentPage.SectionViewConfig Msg
fluidContainerSection ({ translate } as model) =
    { title = translate [] "container-page.fluid-containers.title"
    , suggestions = Nothing
    , content =
        [ p [] [ Html.text <| translate [] "container-page.fluid-containers.description" ]
        , ComponentViewer.view
            { id = "row-fluid"
            , isCodeVisible = ComponentPage.isInspecting "row-fluid" model
            , onTogglePreview = ToggleInspect
            , boxType = Box.Light
            , label = "row container fluid"
            , example = "TODO"
            }
            [ viewExampleContainer Container.row
            ]
        , ComponentViewer.view
            { id = "column-fluid"
            , isCodeVisible = ComponentPage.isInspecting "column-fluid" model
            , onTogglePreview = ToggleInspect
            , boxType = Box.Light
            , label = "column container fluid"
            , example = "TODO"
            }
            [ viewExampleContainer Container.column
            ]
        ]
    }


viewExampleContainer : Container.Config msg -> Html msg
viewExampleContainer config =
    config
        |> Container.withClass "container--debug"
        |> Container.withContent exampleContent
        |> Container.render


exampleContent : List (Html msg)
exampleContent =
    List.range 1 3
        |> List.map
            (\i ->
                div []
                    [ p [] [ text <| "Content Area " ++ String.fromInt i ]
                    , p [] [ Html.text PyxisHelpers.loremIpsum ]
                    ]
            )

module Pages.Link exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage
import Pages.Link.Model exposing (Model, Msg(..))
import Prima.Pyxis.Link as PyxisLink


view : Model -> Html Msg
view model =
    div [ class "link-page" ]
        [ ComponentPage.view
            { title = "Link"
            , description = ""
            , specs = Nothing
            , sections =
                [ regularLinkSection model
                , standaloneLink model
                ]
            }
        ]


regularLinkSection : Model -> ComponentPage.SectionViewConfig Msg
regularLinkSection model =
    { title = "Regular Link"
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { id = "link"
            , isCodeVisible = ComponentPage.isInspecting "link" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = ComponentViewer.boxTypeToLabel Box.Light
            , onTogglePreview = ToggleInspect
            , onCopyCode = CopyToClipboard
            }
            [ viewRegularLink "Regular Link"
            , viewRegularLinkWithIcon "Link with icon"
            ]
        , ComponentViewer.view
            { id = "link-dark"
            , isCodeVisible = ComponentPage.isInspecting "link-dark" model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = ComponentViewer.boxTypeToLabel Box.Dark
            , onTogglePreview = ToggleInspect
            , onCopyCode = CopyToClipboard
            }
            [ viewRegularLink "Regular Link"
            , viewRegularLinkWithIcon "Link with icon"
            ]
        ]
    }


standaloneLink : Model -> ComponentPage.SectionViewConfig Msg
standaloneLink model =
    { title = "Standalone Link"
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { id = "standalone"
            , isCodeVisible = ComponentPage.isInspecting "standalone" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "on light color"
            , onTogglePreview = ToggleInspect
            , onCopyCode = CopyToClipboard
            }
            [ viewStandaloneLink "Standalone Link"
            , viewStandaloneLinkWithIcon "Standalone with icon"
            ]
        , ComponentViewer.view
            { id = "standalone-dark"
            , isCodeVisible = ComponentPage.isInspecting "standalone-dark" model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = "on dark color"
            , onTogglePreview = ToggleInspect
            , onCopyCode = CopyToClipboard
            }
            [ viewStandaloneLink "Standalone Link"
            , viewStandaloneLinkWithIcon "Standalone with icon"
            ]
        ]
    }


viewRegularLink : String -> Html Msg
viewRegularLink text =
    PyxisLink.simple text
        |> PyxisLink.withHref "#"
        |> PyxisLink.render


viewRegularLinkWithIcon : String -> Html Msg
viewRegularLinkWithIcon text =
    PyxisLink.simple text
        |> PyxisLink.withHref "#"
        |> PyxisLink.withIcon "art"
        |> PyxisLink.render


viewStandaloneLink : String -> Html Msg
viewStandaloneLink text =
    PyxisLink.standalone text
        |> PyxisLink.withHref "#"
        |> PyxisLink.render


viewStandaloneLinkWithIcon : String -> Html Msg
viewStandaloneLinkWithIcon text =
    PyxisLink.standalone text
        |> PyxisLink.withHref "#"
        |> PyxisLink.withIcon "art"
        |> PyxisLink.render

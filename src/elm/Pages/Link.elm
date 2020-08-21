module Pages.Link exposing
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
import Pages.Accordion.Model exposing (Msg(..))
import Pages.Component as ComponentPage exposing (WithCodeInspectors)
import Prima.Pyxis.Link as PyxisLink


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



-- VIEW


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
            }
            [ PyxisLink.simple "Regular Link"
                |> PyxisLink.withHref "#"
                |> PyxisLink.render
            , PyxisLink.simple "Link with icon"
                |> PyxisLink.withHref "#"
                |> PyxisLink.withIcon "art"
                |> PyxisLink.render
            ]
        , ComponentViewer.view
            { id = "link-dark"
            , isCodeVisible = ComponentPage.isInspecting "link-dark" model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = ComponentViewer.boxTypeToLabel Box.Dark
            , onTogglePreview = ToggleInspect
            }
            [ PyxisLink.simple "Regular Link"
                |> PyxisLink.withHref "#"
                |> PyxisLink.render
            , PyxisLink.simple "Link with icon"
                |> PyxisLink.withHref "#"
                |> PyxisLink.withIcon "art"
                |> PyxisLink.render
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
            }
            [ PyxisLink.standalone "Standalone Link"
                |> PyxisLink.withHref "#"
                |> PyxisLink.render
            , PyxisLink.standalone "Standalone with icon"
                |> PyxisLink.withHref "#"
                |> PyxisLink.withIcon "art"
                |> PyxisLink.render
            ]
        , ComponentViewer.view
            { id = "standalone-dark"
            , isCodeVisible = ComponentPage.isInspecting "standalone-dark" model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = "on dark color"
            , onTogglePreview = ToggleInspect
            }
            [ PyxisLink.standalone "Standalone Link"
                |> PyxisLink.withHref "#"
                |> PyxisLink.render
            , PyxisLink.standalone "Standalone with icon"
                |> PyxisLink.withHref "#"
                |> PyxisLink.withIcon "art"
                |> PyxisLink.render
            ]
        ]
    }

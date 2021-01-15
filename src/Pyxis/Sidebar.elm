module Pyxis.Sidebar exposing (Msg, Sidebar, sidebar, update, view)

import Html exposing (Html, nav)
import Html.Attributes exposing (class)
import Pyxis.Model.Route as Route exposing (Route)
import Pyxis.Sidebar.LinkNode as LinkNode exposing (LinkNode)
import Pyxis.Update.Helpers as UH


type Msg
    = Toggle String Bool
    | OnRouteChange Route


type alias Sidebar =
    List LinkNode


sidebar : Sidebar
sidebar =
    [ LinkNode.leaf Route.Welcome
    , LinkNode.leaf Route.GetStarted
    , LinkNode.node Route.Style
        |> LinkNode.addChild (LinkNode.leaf Route.Logo)
        |> LinkNode.addChild (LinkNode.leaf Route.Typography)
        |> LinkNode.addChild (LinkNode.leaf Route.Colors)
        |> LinkNode.addChild (LinkNode.leaf Route.Illustration)
        |> LinkNode.addChild (LinkNode.leaf Route.Iconography)
    , LinkNode.node Route.Content
        |> LinkNode.addChild (LinkNode.leaf Route.VoiceAndTone)
        |> LinkNode.addChild (LinkNode.leaf Route.GrammarAndMechanics)
    , LinkNode.node Route.Patterns
        |> LinkNode.addChild (LinkNode.leaf Route.ElevationAndShadows)
        |> LinkNode.addChild (LinkNode.leaf Route.BorderRadius)
        |> LinkNode.addChild (LinkNode.leaf Route.Containers)
    , LinkNode.node Route.Tools
        |> LinkNode.addChild (LinkNode.leaf Route.UIKits)
        |> LinkNode.addChild (LinkNode.leaf Route.Fonts)
        |> LinkNode.addChild (LinkNode.leaf Route.Icons)
    ]


view : Sidebar -> Html Msg
view sidebarConfig =
    nav
        [ class "pyxis__sidebar" ]
        (List.map (LinkNode.view Toggle OnRouteChange) sidebarConfig)


update : Msg -> Sidebar -> ( Sidebar, Cmd Msg, Maybe Route.Route )
update msg model =
    case msg of
        Toggle route isOpen ->
            model
                |> toggleAccordion isOpen route
                |> UH.withoutCmds
                |> UH.withoutRouteChange

        OnRouteChange route ->
            model
                |> UH.withoutCmds
                |> UH.withRouteChange route


toggleAccordion : Bool -> String -> Sidebar -> Sidebar
toggleAccordion wasOpen routeSlug =
    List.map LinkNode.close
        >> List.map (LinkNode.mapIfRouteSlugMatches routeSlug (LinkNode.toggle wasOpen))

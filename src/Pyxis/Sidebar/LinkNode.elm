module Pyxis.Sidebar.LinkNode exposing
    ( LinkNode
    , addChild
    , close
    , leaf
    , mapIfRouteSlugMatches
    , node
    , open
    , pickRoute
    , setAccordionState
    , toggle
    , view
    )

import Html exposing (Html, a, li, text, ul)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Prima.Pyxis.Accordion as Accordion
import Pyxis.Route as Route exposing (Route)


type LinkNode
    = Leaf Route
    | Node NodeConfig


type alias NodeConfig =
    { route : Route
    , children : List LinkNode
    , accordionState : Accordion.State
    }


leaf : Route -> LinkNode
leaf =
    Leaf


node : Route -> LinkNode
node route =
    Node
        { route = route
        , children = []
        , accordionState = Accordion.state False
        }


addChild : LinkNode -> LinkNode -> LinkNode
addChild child linkNode =
    case linkNode of
        Leaf route ->
            Node
                { route = route
                , children = [ child ]
                , accordionState = Accordion.state False
                }

        Node config ->
            Node
                { route = config.route
                , children = List.append config.children [ child ]
                , accordionState = config.accordionState
                }


pickRoute : LinkNode -> Route
pickRoute linkNode =
    case linkNode of
        Leaf route ->
            route

        Node config ->
            config.route


view : (String -> Bool -> msg) -> (Route -> msg) -> LinkNode -> Html msg
view toggleMsg routeChangeMsg linkNode =
    case linkNode of
        Leaf route ->
            viewLeaf routeChangeMsg route

        Node config ->
            viewNode toggleMsg routeChangeMsg config


viewLeaf : (Route -> msg) -> Route -> Html msg
viewLeaf routeChangeMsg route =
    a
        [ class "pyxis__sidebar__item"
        ]
        [ renderLink routeChangeMsg route
        ]


viewNode : (String -> Bool -> msg) -> (Route -> msg) -> NodeConfig -> Html msg
viewNode toggleMsg routeChangeMsg { route, children, accordionState } =
    toggleMsg
        |> Accordion.light (Route.routeToSlug route)
        |> Accordion.withSimpleTitle (Route.routeToLabel route)
        |> Accordion.withContent [ renderChildren routeChangeMsg children ]
        |> Accordion.render accordionState


renderChildren : (Route -> msg) -> List LinkNode -> Html msg
renderChildren routeChangeMsg children =
    ul
        [ class "pyxis__sidebar__list" ]
        (List.map
            (\child ->
                li
                    [ class "pyxis__sidebar__list__item"
                    ]
                    [ renderLink routeChangeMsg (pickRoute child) ]
            )
            children
        )


renderLink : (Route -> msg) -> Route -> Html msg
renderLink routeChangeMsg route =
    a
        [ class "pyxis__sidebar__list__item__link"
        , href "#"
        , onClick (routeChangeMsg route)
        ]
        [ route
            |> Route.routeToLabel
            |> text
        ]


setAccordionState : Accordion.State -> LinkNode -> LinkNode
setAccordionState state linkNode =
    case linkNode of
        Leaf _ ->
            linkNode

        Node config ->
            Node { config | accordionState = state }


close : LinkNode -> LinkNode
close =
    setAccordionState Accordion.close


open : LinkNode -> LinkNode
open =
    setAccordionState Accordion.open


toggle : Bool -> LinkNode -> LinkNode
toggle wasOpen =
    if wasOpen then
        setAccordionState Accordion.close

    else
        setAccordionState Accordion.open


mapIfRouteSlugMatches : String -> (LinkNode -> LinkNode) -> LinkNode -> LinkNode
mapIfRouteSlugMatches routeSlug mapper linkNode =
    if routeSlug == Route.routeToSlug (pickRoute linkNode) then
        mapper linkNode

    else
        linkNode

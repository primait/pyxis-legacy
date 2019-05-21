module Pyxis.ViewHelpers exposing
    ( componentInspectorToggle
    , componentShowdown
    , componentTitle
    , divider
    , inspectableHtml
    , renderHTMLContent
    , renderIf
    , renderMaybe
    , renderOrNothing
    , renderUnless
    , wrapper
    )

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList)
import Html.Events exposing (onClick)
import Html.Parser as Parser
import Html.Parser.Util as ParserUtil
import Pyxis.Helpers
    exposing
        ( toInspectableSelector
        )



---------------------------------------
-- RENDER UTILITIES
---------------------------------------


renderIf : Bool -> Html msg -> Html msg
renderIf check html =
    if check then
        html

    else
        text ""


renderUnless : Bool -> Html msg -> Html msg
renderUnless check =
    renderIf (not check)


renderMaybe : Maybe a -> Html msg -> Html msg
renderMaybe theMaybe html =
    case theMaybe of
        Just _ ->
            html

        Nothing ->
            text ""


renderOrNothing : Maybe (Html msg) -> Html msg
renderOrNothing maybeHtml =
    Maybe.withDefault (text "") maybeHtml


renderHTMLContent : String -> List (Html msg)
renderHTMLContent =
    Maybe.withDefault [] << Maybe.map ParserUtil.toVirtualDom << Result.toMaybe << Parser.run



---------------------------------------
-- COMMON UI UTILITIES
---------------------------------------


wrapper : List (Html msg) -> Html msg
wrapper =
    div
        [ class "pyWrapper"
        ]


componentTitle : List (Html msg) -> Html msg
componentTitle =
    h2 [ class "pySubtitle" ]


componentShowdown : String -> String -> (String -> msg) -> List (Html msg) -> Html msg
componentShowdown label selector action content =
    section
        []
        [ h4
            []
            [ text label
            , componentInspectorToggle action selector
            ]
        , inspectableHtml selector content
        , divider
        ]


componentInspectorToggle : (String -> msg) -> String -> Html msg
componentInspectorToggle action selector =
    i
        [ class "pyIcon pyIconInspect a-icon-search"
        , (onClick
            << action
            << String.join "."
            << (::) ""
            << String.split " "
            << toInspectableSelector
          )
            selector
        ]
        []


divider : Html msg
divider =
    hr [ class "pyDivider" ] []


inspectableHtml : String -> List (Html msg) -> Html msg
inspectableHtml selector content =
    div
        [ (class << toInspectableSelector) selector ]
        content

module Pyxis.View exposing (view)

import Browser
import Html exposing (..)
import Pyxis.AppMessages.View as AppMessages
import Pyxis.Components.View as Components
import Pyxis.HtmlSnippet.View as HtmlSnippet
import Pyxis.Model
    exposing
        ( AppStatus(..)
        , Model
        , Msg(..)
        , Route(..)
        )
import Pyxis.Nav.View as Nav
import Pyxis.ViewHelpers exposing (wrapper)


view : Model -> Browser.Document Msg
view ({ htmlSnippet, appMessages } as model) =
    Browser.Document
        "Prima Assicurazioni"
        [ Nav.view model
        , Components.view model
        , HtmlSnippet.view htmlSnippet
        , AppMessages.view appMessages
        ]

port module Pyxis.Ports exposing (..)

import Pyxis.Model
    exposing
        ( HtmlSelector
        , HtmlSnippet
        )


port copyToClipboard : HtmlSelector -> Cmd msg


port copied : (Bool -> msg) -> Sub msg


port inspectHtml : HtmlSelector -> Cmd msg


port htmlSnippet : (HtmlSnippet -> msg) -> Sub msg

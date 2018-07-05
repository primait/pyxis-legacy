port module Pyxis.Ports exposing (..)

import Pyxis.Model
    exposing
        ( HtmlSelector
        , HtmlSnippet
        )


port copyToClipboard : HtmlSelector -> Cmd msg


port inspectHtml : HtmlSelector -> Cmd msg


port htmlSnippet : (HtmlSnippet -> msg) -> Sub msg

port module Pyxis.Ports exposing (clickedOutside, copied, copyToClipboard, htmlSnippet, inspectHtml)

import Pyxis.Model
    exposing
        ( HtmlSelector
        , HtmlSnippet
        )


port copyToClipboard : HtmlSelector -> Cmd msg


port copied : (Bool -> msg) -> Sub msg


port inspectHtml : HtmlSelector -> Cmd msg


port htmlSnippet : (HtmlSnippet -> msg) -> Sub msg


port clickedOutside : (Bool -> msg) -> Sub msg

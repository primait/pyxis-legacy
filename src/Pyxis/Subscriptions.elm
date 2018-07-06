module Pyxis.Subscriptions exposing (subscriptions)

import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.Ports as Ports


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Ports.htmlSnippet ShowSource
        , Ports.copied (\_ -> Copied)
        ]

module Pyxis exposing (..)

import Browser
import Browser.Navigation exposing (Key)
import Pyxis.Model exposing (Flags, Model, Msg(..), initialModel)
import Pyxis.Subscriptions as Subscriptions
import Pyxis.Update as Update
import Pyxis.View as View
import Url exposing (Url)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        , onUrlChange = OnUrlChange
        , onUrlRequest = OnUrlRequest
        }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    ( initialModel, Cmd.none )

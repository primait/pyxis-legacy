module Pyxis exposing (..)

import Browser
import Browser.Navigation
import Pyxis.Helpers as PH
import Pyxis.Model as M exposing (Flags, Model, Msg(..))
import Pyxis.Update as Update
import Pyxis.View as View
import Url exposing (Url)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = View.view
        , update = Update.update
        , subscriptions = always Sub.none
        , onUrlRequest = ClickedLink
        , onUrlChange = ChangedUrl
        }


init : Flags -> Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    M.initialModel url key
        |> PH.withoutCmds

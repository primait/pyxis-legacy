module Pyxis exposing (main)

import Browser
import Browser.Navigation
import Helpers as PH
import Model as M exposing (Flags, Model, Msg(..))
import Update as Update
import Url exposing (Url)
import View as View


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
    M.initialModel flags url key
        |> PH.withoutCmds

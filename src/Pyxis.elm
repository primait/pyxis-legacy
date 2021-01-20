module Pyxis exposing (..)

import Browser
import Browser.Navigation as Nav
import Pyxis.Model as PyxisModel
import Pyxis.Ports as Ports
import Pyxis.Route as Route
import Pyxis.Subscriptions as Subscriptions
import Pyxis.Update as Update
import Pyxis.UpdateHelpers as UH
import Pyxis.View as View
import Url exposing (Url)


main : Program PyxisModel.Flags PyxisModel.Model PyxisModel.Msg
main =
    Browser.application
        { init = init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        , onUrlChange = PyxisModel.OnUrlChange
        , onUrlRequest = PyxisModel.OnUrlRequest
        }


init : PyxisModel.Flags -> Url -> Nav.Key -> ( PyxisModel.Model, Cmd PyxisModel.Msg )
init flags url key =
    PyxisModel.initialModel url key
        |> UH.withoutCmds

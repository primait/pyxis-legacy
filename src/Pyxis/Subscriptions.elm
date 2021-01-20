module Pyxis.Subscriptions exposing (subscriptions)

import Pyxis.Model as PyxisModel
import Pyxis.Pages.Colors as Colors
import Pyxis.Ports as Ports


subscriptions : PyxisModel.Model -> Sub PyxisModel.Msg
subscriptions _ =
    Sub.batch
        [ Ports.copyAcknowledgement (PyxisModel.ColorsMsg << always Colors.CopyAcknowledgement) ]

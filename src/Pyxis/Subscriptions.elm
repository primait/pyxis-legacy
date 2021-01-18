module Pyxis.Subscriptions exposing (subscriptions)

import Pyxis.Model as PyxisModel
import Pyxis.Pages.Colors as Colors
import Pyxis.Ports as Ports


subscriptions : PyxisModel.Model -> Sub PyxisModel.Msg
subscriptions model =
    Sub.batch
        [ Ports.copyAcknowledgement (PyxisModel.ColorsMsg << always Colors.CopyAcknowledgement) ]

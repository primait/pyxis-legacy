module Pyxis.Subscriptions exposing (subscriptions)

import Pyxis.Model as PyxisModel
import Pyxis.Pages.Button as Button
import Pyxis.Pages.Button.Ports as ButtonPorts
import Pyxis.Pages.Colors as Colors
import Pyxis.Ports as Ports


subscriptions : PyxisModel.Model -> Sub PyxisModel.Msg
subscriptions _ =
    Sub.batch
        [ Ports.copyAcknowledgement (PyxisModel.ColorsMsg << always Colors.CopyAcknowledgement)
        , ButtonPorts.receivedInnerHTML (PyxisModel.ButtonMsg << Button.ReceivedInnerHTML)
        ]

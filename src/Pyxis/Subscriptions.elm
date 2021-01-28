module Pyxis.Subscriptions exposing (subscriptions)

import Pyxis.Model as PyxisModel
import Pyxis.Page.Button as Button
import Pyxis.Page.Button.Ports as ButtonPorts
import Pyxis.Page.Colors as Colors
import Pyxis.Ports as Ports


subscriptions : PyxisModel.Model -> Sub PyxisModel.Msg
subscriptions _ =
    Sub.batch
        [ Ports.copyAcknowledgement (PyxisModel.ColorsMsg << always Colors.CopyAcknowledgement)
        , ButtonPorts.receivedInnerHTML (PyxisModel.ButtonMsg << Button.ReceivedInnerHTML)
        ]

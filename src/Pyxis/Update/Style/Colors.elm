module Pyxis.Update.Style.Colors exposing (update)

import Process
import Pyxis.Model.Style.Colors as Colors
import Pyxis.Ports
import Pyxis.Update.Helpers as UH
import SmoothScroll exposing (scrollTo)
import Task


update : Colors.Msg -> Colors.Model -> ( Colors.Model, Cmd Colors.Msg )
update msg model =
    case Debug.log "ho copiato" msg of
        Colors.CopyToClipboard pyxisColor ->
            model
                |> updateColorCopied True
                |> UH.withCmds
                    [ Pyxis.Ports.copyToClipboard (Colors.pyxisColorToHexRGB pyxisColor)
                    ]

        Colors.CopyAcknowledgement ->
            model
                |> updateColorCopied True
                |> UH.withCmds
                    [ delay 50 Colors.UnsetColorCopied
                    ]

        Colors.UnsetColorCopied ->
            model
                |> updateColorCopied False
                |> UH.withoutCmds

        Colors.SmoothScroll id ->
            model
                |> UH.withCmds [ Task.attempt (always Colors.NoOp) (scrollTo id) ]

        Colors.NoOp ->
            model
                |> UH.withoutCmds


updateColorCopied : Bool -> Colors.Model -> Colors.Model
updateColorCopied bool model =
    { model | colorCopied = bool }


delay : Float -> msg -> Cmd msg
delay time msg =
    Process.sleep time
        |> Task.andThen (always <| Task.succeed msg)
        |> Task.perform identity

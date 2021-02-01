module Pyxis.UpdateHelpers exposing
    ( delay
    , replaceUrl
    , sendCmd
    , withCmds
    , withRouteChange
    , withoutCmds
    , withoutRouteChange
    )

import Browser.Navigation as Nav
import Process
import Pyxis.Route as Route
import Task


withCmds : List (Cmd msg) -> model -> ( model, Cmd msg )
withCmds cmds model =
    ( model, Cmd.batch cmds )


withoutCmds : model -> ( model, Cmd msg )
withoutCmds =
    withCmds []


withRouteChange : Route.Route -> ( model, Cmd msg ) -> ( model, Cmd msg, Maybe Route.Route )
withRouteChange route ( model, cmd ) =
    ( model, cmd, Just route )


withoutRouteChange : ( model, Cmd msg ) -> ( model, Cmd msg, Maybe Route.Route )
withoutRouteChange ( model, cmd ) =
    ( model, cmd, Nothing )


sendCmd : msg -> Cmd msg
sendCmd =
    Task.perform identity << Task.succeed


replaceUrl : Nav.Key -> Route.Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (Route.routeToString route)


delay : Float -> msg -> Cmd msg
delay time msg =
    Process.sleep time
        |> Task.andThen (always <| Task.succeed msg)
        |> Task.perform identity

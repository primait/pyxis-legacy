module Pyxis.Components.Lists.Update exposing (update)

import Pyxis.Components.Lists.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.Helpers
    exposing
        ( withCmds
        , withoutCmds
        )
import Pyxis.Ports as Ports


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InspectHtml selector ->
            model |> withCmds [ Ports.inspectHtml selector ]

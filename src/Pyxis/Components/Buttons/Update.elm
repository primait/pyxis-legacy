module Pyxis.Components.Buttons.Update exposing (update)

import Pyxis.Components.Buttons.Model
    exposing
        ( Btn
        , BtnType(..)
        , Model
        , Msg(..)
        , btnTypeToString
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
        EnableBtn btnType ->
            model |> withoutCmds

        DisableBtn btnType ->
            model |> withoutCmds

        InspectHtml selector ->
            model |> withCmds [ Ports.inspectHtml selector ]

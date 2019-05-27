module Pyxis.Components.Table.Update exposing (update)

import Pyxis.Components.Table.Model
    exposing
        ( Model
        , Msg(..)
        , Sort(..)
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
        Sort ->
            { model
                | sortOrder =
                    case model.sortOrder of
                        Nothing ->
                            Just Asc

                        Just Asc ->
                            Just Desc

                        Just Desc ->
                            Nothing
            }
                |> withoutCmds

        InspectHtml selector ->
            model |> withCmds [ Ports.inspectHtml selector ]

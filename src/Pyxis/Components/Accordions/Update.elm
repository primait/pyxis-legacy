module Pyxis.Components.Accordions.Update exposing (update)

import Pyxis.Components.Accordions.Model
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

        Toggle slug ->
            { model
                | accordions =
                    List.map
                        (\accordion ->
                            if accordion.slug == slug then
                                { accordion | isOpen = not accordion.isOpen }

                            else
                                accordion
                        )
                        model.accordions
            }
                |> withoutCmds

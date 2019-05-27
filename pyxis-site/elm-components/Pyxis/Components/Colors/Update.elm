module Pyxis.Components.Colors.Update exposing (update)

import Pyxis.Components.Colors.Model
    exposing
        ( Color
        , ColorTone(..)
        , Model
        , Msg(..)
        , colorToneToString
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
        PickTone color tone ->
            let
                colorClass =
                    String.join "-" [ ".bg", color.name, colorToneToString tone ]

                selector =
                    String.join ""
                        [ ".pyColorScheme__item__tone"
                        , colorClass
                        ]
            in
            model |> withCmds [ Ports.copyToClipboard selector ]

module Message.View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Message.Model exposing (Model, Msg)
import Prima.Pyxis.Message as Message
import Pyxis.Helpers as Helpers


view : Model -> Html Msg
view model =
    div
        []
        [ Helpers.pyxisStyle
        , div
            [ class "a-container a-container--medium directionColumn" ]
            ([ Message.messageInfoConfig
             , Message.messageSuccessConfig
             , Message.messageErrorConfig
             ]
                |> List.map messageBuilder
                |> List.intersperse Helpers.spacer
            )
        ]


messageBuilder : (List (Html Msg) -> Message.Config Msg) -> Html Msg
messageBuilder mapper =
    (Message.render << mapper << List.singleton << text) "Lorem ipsum dolor sit amet."

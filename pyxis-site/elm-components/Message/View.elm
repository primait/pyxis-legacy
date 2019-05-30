module Message.View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, id)
import Message.Model exposing (Model, Msg)
import Prima.Pyxis.Message as Message
import Pyxis.Helpers as Helpers


view : Model -> Html Msg
view model =
    div
        []
        [ Helpers.pyxisStyle
        , Helpers.elmSyntaxWrapper
            (model.messageList
                |> List.map messageBuilder
                |> List.intersperse Helpers.spacer
            )
        ]


messageBuilder : (List (Html Msg) -> Message.Config Msg) -> Html Msg
messageBuilder config =
    (Message.render << config << List.singleton << text) "Lorem ipsum dolor sit amet."

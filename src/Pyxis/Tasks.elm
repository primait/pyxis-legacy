module Pyxis.Tasks exposing (..)

import Date exposing (Date)
import Http
import Pyxis.Components.Footer.Model as FooterModel
import Pyxis.Components.Form.Model as FormModel
import Pyxis.Components.Header.Model as HeaderModel
import Pyxis.Components.Messages.Model as MessagesModel
import Pyxis.Model exposing (Model, Msg(..))
import Task


fetchTodayDate : Cmd Msg
fetchTodayDate =
    Task.perform (FormMsg << FormModel.FetchTodayDate) Date.now


fetchHeaderTemplate : String -> Cmd Msg
fetchHeaderTemplate url =
    (Http.send (HeaderMsg << HeaderModel.FetchTemplate) << Http.getString) url


fetchFooterTemplate : String -> Cmd Msg
fetchFooterTemplate url =
    (Http.send (FooterMsg << FooterModel.FetchTemplate) << Http.getString) url


fetchMessagesTemplate : String -> Cmd Msg
fetchMessagesTemplate url =
    (Http.send (MessagesMsg << MessagesModel.FetchTemplate) << Http.getString) url

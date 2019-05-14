module Pyxis.Tasks exposing
    ( fetchFooterTemplate
    , fetchHeaderTemplate
    , fetchMessagesTemplate
    , fetchTodayDate
    )

import Http
import Pyxis.Components.Footer.Model as FooterModel
import Pyxis.Components.Form.Model as FormModel
import Pyxis.Components.Header.Model as HeaderModel
import Pyxis.Components.Messages.Model as MessagesModel
import Pyxis.Model exposing (Model, Msg(..))
import Task
import Time


fetchTodayDate : Cmd Msg
fetchTodayDate =
    Task.perform (FormMsg << FormModel.FetchTodayDate) Time.now


fetchMessagesTemplate : String -> Cmd Msg
fetchMessagesTemplate url =
    fetchTemplate url (MessagesMsg << MessagesModel.FetchTemplate)


fetchHeaderTemplate : String -> Cmd Msg
fetchHeaderTemplate url =
    fetchTemplate url (HeaderMsg << HeaderModel.FetchTemplate)


fetchFooterTemplate : String -> Cmd Msg
fetchFooterTemplate url =
    fetchTemplate url (FooterMsg << FooterModel.FetchTemplate)


fetchTemplate : String -> (Result Http.Error String -> Msg) -> Cmd Msg
fetchTemplate url mapper =
    Http.request
        { url = url
        , method = "GET"
        , headers = []
        , body = Http.emptyBody
        , expect = Http.expectString mapper
        , tracker = Nothing
        , timeout = Nothing
        }

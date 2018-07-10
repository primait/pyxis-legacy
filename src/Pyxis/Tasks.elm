module Pyxis.Tasks exposing (..)

import Date exposing (Date)
import Pyxis.Components.Form.Model as FormModel
import Pyxis.Model exposing (Model, Msg(..))
import Task


fetchTodayDate : Cmd Msg
fetchTodayDate =
    Task.perform (FormMsg << FormModel.FetchTodayDate) Date.now

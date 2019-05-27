module Pyxis.Tasks exposing (fetchTodayDate)

import Http
import Pyxis.Components.Form.Model as FormModel
import Pyxis.Model exposing (Model, Msg(..))
import Task
import Time


fetchTodayDate : Cmd Msg
fetchTodayDate =
    Task.perform (FormMsg << FormModel.FetchTodayDate) Time.now

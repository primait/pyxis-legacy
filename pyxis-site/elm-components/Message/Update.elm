module Message.Update exposing (update)

import Message.Model exposing (Model, Msg(..))


update : Msg -> Model -> Model
update msg model =
    model

module Button.Update exposing (update)

import Button.Model
    exposing
        ( Btn
        , Model
        , Msg(..)
        )
import Button.View exposing (view)
import Prima.Pyxis.Button as Button


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )

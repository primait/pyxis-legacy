module App exposing (..)

import Html
import Pyxis.Model
    exposing
        ( Model
        , Msg(..)
        , initialModel
        )
import Pyxis.Subscriptions exposing (subscriptions)
import Pyxis.Update exposing (update)
import Pyxis.View exposing (view)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    initialModel ! []

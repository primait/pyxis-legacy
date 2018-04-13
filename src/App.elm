module App exposing (..)

import Achille.Model
    exposing
        ( Model
        , Msg(..)
        , initialModel
        )
import Achille.Subscriptions exposing (subscriptions)
import Achille.Update exposing (update)
import Achille.View exposing (view)
import Html


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

module Form exposing (main)

import Browser
import Form.Model exposing (Model, Msg, initialModel)
import Form.Update exposing (update)
import Form.View exposing (view)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )

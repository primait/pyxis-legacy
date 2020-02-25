module Table exposing (main)

import Browser
import Table.Model exposing (Model, Msg, initialModel)
import Table.Update exposing (update)
import Table.View exposing (view)


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

module FormTooltip exposing (main)

import Browser
import FormTooltip.Model exposing (Model, Msg, initialModel)
import FormTooltip.Update exposing (update)
import FormTooltip.View exposing (view)


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

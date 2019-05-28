module Message exposing (main)

import Browser
import Message.Model exposing (Model, Msg, initialModel)
import Message.Update exposing (update)
import Message.View exposing (view)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

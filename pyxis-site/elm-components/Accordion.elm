module Accordion exposing (main)

import Accordion.Model exposing (Model, Msg, initialModel)
import Accordion.Update exposing (update)
import Accordion.View exposing (view)
import Browser


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

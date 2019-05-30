module Table exposing (main)

import Browser
import Table.Model exposing (Model, Msg, initialModel)
import Table.Update exposing (update)
import Table.View exposing (view)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

module Loader exposing (main)

import Browser
import Loader.Model
    exposing
        ( Flags
        , LoaderType(..)
        , Model
        , Msg
        , initialModel
        , loaderTypeFromString
        )
import Loader.Update exposing (update)
import Loader.View exposing (view)


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { initialModel
        | loaderList =
            (Maybe.withDefault []
                << Maybe.map List.singleton
                << loaderTypeFromString
            )
                flags.loaderType
      }
    , Cmd.none
    )

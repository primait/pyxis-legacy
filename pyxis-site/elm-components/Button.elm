module Button exposing (main)

import Browser
import Button.Model
    exposing
        ( Btn
        , BtnType(..)
        , Flags
        , Model
        , Msg
        , btnTypeFromString
        , initialModel
        )
import Button.Update exposing (update)
import Button.View exposing (view)


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
    let
        maybeBtnType =
            btnTypeFromString flags.buttonType
    in
    ( { initialModel
        | buttons =
            List.filter
                ((==) maybeBtnType
                    << Just
                    << .type_
                )
                initialModel.buttons
      }
    , Cmd.none
    )

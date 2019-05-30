module Accordion exposing (main)

import Accordion.Model
    exposing
        ( AccordionType(..)
        , Flags
        , Model
        , Msg
        , accordionBuilder
        , accordionTypeFromString
        , initialModel
        )
import Accordion.Update exposing (update)
import Accordion.View exposing (view)
import Browser


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
        | accordionList =
            (List.singleton
                << accordionBuilder
                << Maybe.withDefault Base
                << accordionTypeFromString
            )
                flags.accordionType
      }
    , Cmd.none
    )

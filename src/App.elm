module App exposing (..)

import DatePicker
import Html
import Pyxis.Helpers
    exposing
        ( updateMenu
        , withCmds
        , withoutCmds
        )
import Pyxis.Model
    exposing
        ( Flags
        , Model
        , Msg(..)
        , Route(..)
        , initialModel
        )
import Pyxis.Subscriptions exposing (subscriptions)
import Pyxis.Update exposing (update)
import Pyxis.View exposing (view)


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        ( datepicker, dpCmd ) =
            DatePicker.init

        { form } =
            initialModel
    in
    { initialModel
        | route = toRoute flags.route
        , menu = updateMenu (toRoute flags.route) initialModel.menu
        , form = { form | datepicker = Just datepicker }
    }
        |> withoutCmds


toRoute : String -> Route
toRoute str =
    case String.toLower str of
        "/form" ->
            FormRoute

        _ ->
            initialModel.route

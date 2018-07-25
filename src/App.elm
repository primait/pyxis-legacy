module App exposing (..)

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
import Pyxis.Tasks as Tasks
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
    { initialModel
        | route = toRoute flags.route
        , menu = updateMenu (toRoute flags.route) initialModel.menu
    }
        |> withCmds
            [ Tasks.fetchTodayDate
            , Tasks.fetchHeaderTemplate "static/header.html.txt"
            ]


toRoute : String -> Route
toRoute str =
    case String.toLower str of
        "/buttons" ->
            ButtonsRoute

        "/colors" ->
            ColorsRoute

        "/form" ->
            FormRoute

        "/header" ->
            HeaderRoute

        "/footer" ->
            FooterRoute

        "/tooltips" ->
            TooltipsRoute

        "/typography" ->
            TypographyRoute

        _ ->
            initialModel.route

module App exposing (main)

import Html
import Pyxis.Helpers as Helpers
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
        | route = Helpers.urlToRoute flags.route
        , menu = Helpers.updateMenu (Helpers.urlToRoute flags.route) initialModel.menu
    }
        |> Helpers.withCmds
            [ Tasks.fetchTodayDate
            , Tasks.fetchHeaderTemplate "static/header.html.txt"
            , Tasks.fetchFooterTemplate "static/footer.html.txt"
            , Tasks.fetchMessagesTemplate "static/messages.html.txt"
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

        "/login" ->
            LoginRoute

        "/messages" ->
            MessagesRoute

        "/footer" ->
            FooterRoute

        "/tooltips" ->
            TooltipsRoute

        "/typography" ->
            TypographyRoute

        _ ->
            initialModel.route

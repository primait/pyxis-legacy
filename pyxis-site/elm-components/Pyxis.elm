module Pyxis exposing (main)

import Browser
import Browser.Navigation as Nav
import Pyxis.Helpers as Helpers
import Pyxis.Model
    exposing
        ( Flags
        , Model
        , Msg(..)
        , Route(..)
        , initialModel
        )
import Pyxis.Router as Router
import Pyxis.Subscriptions exposing (subscriptions)
import Pyxis.Update exposing (update)
import Pyxis.View exposing (view)
import Url exposing (Url)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
        }


init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        model =
            initialModel url key

        initialUrl =
            flags.path
                |> Url.fromString
                |> Maybe.withDefault model.url

        route =
            Router.urlToRoute initialUrl
    in
    { model
        | url = initialUrl
        , route = route
    }
        |> Helpers.withCmds []

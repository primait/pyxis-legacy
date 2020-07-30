module Pyxis.Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    )

import Browser exposing (UrlRequest)
import Browser.Navigation
import Pyxis.Router as Router exposing (Route)
import Url exposing (Url)


type Msg
    = ChangedUrl Url
    | ClickedLink UrlRequest


type alias Model =
    { key : Browser.Navigation.Key
    , currentRoute : Route
    }


initialModel : Url -> Browser.Navigation.Key -> Model
initialModel url key =
    let
        _ =
            Debug.log "url" url
    in
    { key = key
    , currentRoute =
        url
            |> Router.fromUrl
            |> Maybe.withDefault Router.Homepage
    }


type alias Flags =
    ()

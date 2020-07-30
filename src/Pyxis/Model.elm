module Pyxis.Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    )

import Browser exposing (UrlRequest)
import Browser.Navigation
import Pyxis.Pages.Accordion.Model as Accordion
import Pyxis.Router as Router exposing (Route)
import Url exposing (Url)


type Msg
    = ChangedUrl Url
    | ClickedLink UrlRequest
    | AccordionMsg Accordion.Msg


type alias Model =
    { key : Browser.Navigation.Key
    , currentRoute : Route
    , accordionModel : Accordion.Model
    }


initialModel : Url -> Browser.Navigation.Key -> Model
initialModel url key =
    { key = key
    , currentRoute = Maybe.withDefault Router.Homepage <| Router.fromUrl url
    , accordionModel = Accordion.initialModel
    }


type alias Flags =
    ()

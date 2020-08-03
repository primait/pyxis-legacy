module Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    )

import Browser exposing (UrlRequest)
import Browser.Navigation
import Pages.Accordion.Model as Accordion
import Pages.Button.Model as Button
import Router as Router exposing (Route)
import Url exposing (Url)


type Msg
    = ChangedUrl Url
    | ClickedLink UrlRequest
    | AccordionMsg Accordion.Msg
    | ButtonMsg Button.Msg


type alias Model =
    { key : Browser.Navigation.Key
    , currentRoute : Route
    , accordionModel : Accordion.Model
    , buttonModel : Button.Model
    }


initialModel : Url -> Browser.Navigation.Key -> Model
initialModel url key =
    { key = key
    , currentRoute = Maybe.withDefault Router.Homepage <| Router.fromUrl url
    , accordionModel = Accordion.initialModel
    , buttonModel = Button.initialModel
    }


type alias Flags =
    ()

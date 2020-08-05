module Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    )

import Browser exposing (UrlRequest)
import Browser.Navigation
import Helpers as H
import Pages.Accordion.Model as Accordion
import Pages.Button.Model as Button
import Route exposing (Route)
import Url exposing (Url)


type Msg
    = NoOp
    | ChangedUrl Url
    | ClickedLink UrlRequest
    | AccordionMsg Accordion.Msg
    | ButtonMsg Button.Msg


type alias Model =
    { key : Browser.Navigation.Key
    , currentRoute : Route
    , accordionModel : Accordion.Model
    , buttonModel : Button.Model
    , t : H.Translator
    }


initialModel : Flags -> Url -> Browser.Navigation.Key -> Model
initialModel flags url key =
    { key = key
    , currentRoute = Maybe.withDefault Route.Homepage <| Route.fromUrl url
    , accordionModel = Accordion.initialModel
    , buttonModel = Button.initialModel
    , t = H.i18nInit flags.translations
    }


type alias Flags =
    { translations : List ( String, String )
    }

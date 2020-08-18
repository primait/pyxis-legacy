module Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    )

import Browser exposing (UrlRequest)
import Browser.Navigation
import Dict exposing (Dict)
import Helpers as H
import Pages.Accordion.Model as Accordion
import Pages.Button.Model as Button
import Pages.Loader as LoaderPage
import Route exposing (Route)
import Url exposing (Url)


type Msg
    = NoOp
    | ChangedUrl Url
    | ClickedLink UrlRequest
    | ChangeRoute (Maybe Route)
    | ToggleMenu Bool
    | ToggleDropDown String Bool
    | AccordionMsg Accordion.Msg
    | ButtonMsg Button.Msg
    | LoaderMsg LoaderPage.Msg


type alias Model =
    { key : Browser.Navigation.Key
    , currentRoute : Route
    , language : String
    , translate : H.Translator
    , isMenuOpen : Bool
    , navbarMenuState : Dict String Bool
    , accordionModel : Accordion.Model
    , buttonModel : Button.Model
    , loaderModel : LoaderPage.Model
    }


initialModel : Flags -> Url -> Browser.Navigation.Key -> Model
initialModel flags url key =
    let
        translator =
            H.i18nInit flags.translations
    in
    { key = key
    , currentRoute = Route.fromUrl url
    , language = flags.language
    , translate = translator
    , isMenuOpen = False
    , navbarMenuState =
        Dict.fromList
            [ ( "style-menu", False )
            , ( "content-menu", False )
            , ( "patterns-menu", False )
            , ( "components-menu", False )
            , ( "nested-menu", False )
            , ( "tools-menu", False )
            ]
    , accordionModel = Accordion.initialModel translator
    , buttonModel = Button.initialModel translator
    , loaderModel = LoaderPage.initialModel translator
    }


type alias Flags =
    { language : String
    , translations : List ( String, String )
    }

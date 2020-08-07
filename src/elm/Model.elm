module Model exposing
    ( DropdownMenu
    , Flags
    , MenuLink
    , Model
    , Msg(..)
    , initialModel
    )

import Array exposing (Array)
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
    | ChangeRoute (Maybe Route)
    | ToggleMenu Bool
    | ToggleDropDown Int Bool
    | AccordionMsg Accordion.Msg
    | ButtonMsg Button.Msg


type alias Model =
    { key : Browser.Navigation.Key
    , currentRoute : Route
    , t : H.Translator
    , isMenuOpen : Bool
    , menuList : Array DropdownMenu
    , accordionModel : Accordion.Model
    , buttonModel : Button.Model
    }


initialModel : Flags -> Url -> Browser.Navigation.Key -> Model
initialModel flags url key =
    { key = key
    , currentRoute = Maybe.withDefault Route.Homepage <| Route.fromUrl url
    , t = H.i18nInit flags.translations
    , isMenuOpen = False
    , menuList = initialMenuListModel
    , accordionModel = Accordion.initialModel
    , buttonModel = Button.initialModel
    }


type alias Flags =
    { translations : List ( String, String )
    }



-- MENU


type alias DropdownMenu =
    { link : MenuLink
    , isOpen : Bool
    , items : List MenuLink
    }


type alias MenuLink =
    { label : String
    , route : Maybe Route
    }


initialMenuListModel : Array DropdownMenu
initialMenuListModel =
    Array.fromList
        [ { link = { label = "navbar.welcome", route = Just Route.Homepage }
          , isOpen = False
          , items = []
          }
        , { link = { label = "navbar.start", route = Nothing }
          , isOpen = False
          , items = []
          }
        , { link = { label = "navbar.style.title", route = Nothing }
          , isOpen = False
          , items = [ { label = "...", route = Nothing } ]
          }
        , { link = { label = "navbar.content.title", route = Nothing }
          , isOpen = False
          , items = [ { label = "...", route = Nothing } ]
          }
        , { link = { label = "navbar.patterns.title", route = Nothing }
          , isOpen = False
          , items = [ { label = "...", route = Nothing } ]
          }
        , { link = { label = "navbar.components.title", route = Nothing }
          , isOpen = False
          , items =
                [ { label = "navbar.components.accordion", route = Just Route.Accordion }
                , { label = "navbar.components.button", route = Just Route.Button }
                , { label = "...", route = Nothing }
                ]
          }
        , { link = { label = "navbar.tools.title", route = Nothing }
          , isOpen = False
          , items = [ { label = "...", route = Nothing } ]
          }
        ]

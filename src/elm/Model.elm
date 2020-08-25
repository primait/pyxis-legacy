module Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    , isDropdownOpen
    )

import Browser exposing (UrlRequest)
import Browser.Navigation
import Dict exposing (Dict)
import Helpers as H
import Pages.Accordion.Model
import Pages.AtrTable.Model
import Pages.Badge.Model
import Pages.Button.Model
import Pages.Container.Model
import Pages.Form.Model
import Pages.Link.Model
import Pages.ListChooser.Model
import Pages.Loader.Model
import Pages.Message.Model
import Pages.Modal.Model
import Pages.Table.Model
import Pages.Tooltip.Model
import Route exposing (Route)
import Url exposing (Url)


type Msg
    = NoOp
    | ChangedUrl Url
    | ClickedLink UrlRequest
    | ChangeRoute (Maybe Route)
    | ToggleMenu Bool
    | ToggleDropDown String Bool
      {-
         COMPONENT PAGES
      -}
    | AccordionPageMsg Pages.Accordion.Model.Msg
    | AtrTablePageMsg Pages.AtrTable.Model.Msg
    | BadgePageMsg Pages.Badge.Model.Msg
    | ButtonPageMsg Pages.Button.Model.Msg
    | ContainerPageMsg Pages.Container.Model.Msg
    | FormPageMsg Pages.Form.Model.Msg
    | LinkPageMsg Pages.Link.Model.Msg
    | ListChooserPageMsg Pages.ListChooser.Model.Msg
    | LoaderPageMsg Pages.Loader.Model.Msg
    | MessagePageMsg Pages.Message.Model.Msg
    | ModalPageMsg Pages.Modal.Model.Msg
    | TablePageMsg Pages.Table.Model.Msg
    | TooltipPageMsg Pages.Tooltip.Model.Msg


type alias Model =
    { key : Browser.Navigation.Key
    , currentRoute : Route
    , language : String
    , translate : H.Translator
    , isMenuOpen : Bool
    , navbarMenuState : Dict String Bool

    {- PAGES MODELS -}
    , accordionModel : Pages.Accordion.Model.Model
    , atrTableModel : Pages.AtrTable.Model.Model
    , badgeModel : Pages.Badge.Model.Model
    , buttonModel : Pages.Button.Model.Model
    , containerModel : Pages.Container.Model.Model
    , formModel : Pages.Form.Model.Model
    , linkModel : Pages.Link.Model.Model
    , listChooserModel : Pages.ListChooser.Model.Model
    , loaderModel : Pages.Loader.Model.Model
    , messageModel : Pages.Message.Model.Model
    , modalModel : Pages.Modal.Model.Model
    , tableModel : Pages.Table.Model.Model
    , tooltipModel : Pages.Tooltip.Model.Model
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

    {- PAGES MODELS -}
    , accordionModel = Pages.Accordion.Model.init translator
    , atrTableModel = Pages.AtrTable.Model.init
    , badgeModel = Pages.Badge.Model.init
    , buttonModel = Pages.Button.Model.init translator
    , containerModel = Pages.Container.Model.init translator
    , formModel = Pages.Form.Model.init
    , linkModel = Pages.Link.Model.init
    , listChooserModel = Pages.ListChooser.Model.init
    , loaderModel = Pages.Loader.Model.init translator
    , messageModel = Pages.Message.Model.init
    , modalModel = Pages.Modal.Model.init
    , tableModel = Pages.Table.Model.init
    , tooltipModel = Pages.Tooltip.Model.init
    }


isDropdownOpen : String -> Model -> Bool
isDropdownOpen id model =
    Maybe.withDefault False (Dict.get id model.navbarMenuState)


type alias Flags =
    { language : String
    , translations : List ( String, String )
    }

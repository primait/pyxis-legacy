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
import Pages.Badge
import Pages.Button.Model
import Pages.Container
import Pages.Form
import Pages.Link
import Pages.ListChooser
import Pages.Loader
import Pages.Message
import Pages.Modal
import Pages.Table
import Pages.Tooltip
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
    | BadgePageMsg Pages.Badge.Msg
    | ButtonPageMsg Pages.Button.Model.Msg
    | ContainerPageMsg Pages.Container.Msg
    | FormPageMsg Pages.Form.Msg
    | LinkPageMsg Pages.Link.Msg
    | ListChooserPageMsg Pages.ListChooser.Msg
    | LoaderPageMsg Pages.Loader.Msg
    | MessagePageMsg Pages.Message.Msg
    | ModalPageMsg Pages.Modal.Msg
    | TablePageMsg Pages.Table.Msg
    | TooltipPageMsg Pages.Tooltip.Msg


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
    , badgeModel : Pages.Badge.Model
    , buttonModel : Pages.Button.Model.Model
    , containerModel : Pages.Container.Model
    , formModel : Pages.Form.Model
    , linkModel : Pages.Link.Model
    , listChooserModel : Pages.ListChooser.Model
    , loaderModel : Pages.Loader.Model
    , messageModel : Pages.Message.Model
    , modalModel : Pages.Modal.Model
    , tableModel : Pages.Table.Model
    , tooltipModel : Pages.Tooltip.Model
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
    , badgeModel = Pages.Badge.init
    , buttonModel = Pages.Button.Model.init translator
    , containerModel = Pages.Container.init translator
    , formModel = Pages.Form.init
    , linkModel = Pages.Link.init
    , listChooserModel = Pages.ListChooser.init
    , loaderModel = Pages.Loader.init translator
    , messageModel = Pages.Message.init
    , modalModel = Pages.Modal.init
    , tableModel = Pages.Table.init
    , tooltipModel = Pages.Tooltip.init
    }


isDropdownOpen : String -> Model -> Bool
isDropdownOpen id model =
    Maybe.withDefault False (Dict.get id model.navbarMenuState)


type alias Flags =
    { language : String
    , translations : List ( String, String )
    }

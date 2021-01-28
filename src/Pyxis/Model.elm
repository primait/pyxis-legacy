module Pyxis.Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    , updateButton
    , updateColors
    , updateModel
    , updateRoute
    , updateSidebar
    )

import Browser exposing (UrlRequest)
import Browser.Navigation as Nav
import Pyxis.Page.Button as Button
import Pyxis.Page.Colors as Colors
import Pyxis.Page.Typography as Typography
import Pyxis.Route as Route
import Pyxis.Sidebar as Sidebar exposing (Sidebar)
import Url exposing (Url)


type Msg
    = ButtonMsg Button.Msg
    | ColorsMsg Colors.Msg
    | OnRouteChange Route.Route
    | OnUrlChange Url
    | OnUrlRequest UrlRequest
    | SidebarMsg Sidebar.Msg
    | TypographyMsg Typography.Msg


type alias Model =
    { route : Route.Route
    , routeKey : Nav.Key
    , sidebar : Sidebar
    , buttonModel : Button.Model
    , colorsModel : Colors.Model
    }


initialModel : Url -> Nav.Key -> Model
initialModel url key =
    { route =
        Route.routeFromUrl url
            |> Maybe.withDefault Route.Welcome
    , routeKey = key
    , sidebar = Sidebar.sidebar
    , buttonModel = Button.initialModel
    , colorsModel = Colors.initialModel
    }


updateModel : (Model -> Model) -> Model -> Model
updateModel mapper =
    mapper


updateRoute : Route.Route -> Model -> Model
updateRoute route =
    updateModel (\m -> { m | route = route })


updateSidebar : Sidebar -> Model -> Model
updateSidebar sidebarModel =
    updateModel (\m -> { m | sidebar = sidebarModel })


updateButton : Button.Model -> Model -> Model
updateButton buttonModel =
    updateModel (\m -> { m | buttonModel = buttonModel })


updateColors : Colors.Model -> Model -> Model
updateColors colorsModel =
    updateModel (\m -> { m | colorsModel = colorsModel })


type alias Flags =
    {}

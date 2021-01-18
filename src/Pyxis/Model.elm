module Pyxis.Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    , updateColors
    , updateModel
    , updateRoute
    , updateSidebar
    )

import Browser exposing (UrlRequest)
import Browser.Navigation as Nav
import Pyxis.Pages.Colors as Colors
import Pyxis.Pages.Typography as Typography
import Pyxis.Route as Route
import Pyxis.Sidebar as Sidebar exposing (Sidebar)
import Url exposing (Url)


type Msg
    = OnUrlChange Url
    | OnUrlRequest UrlRequest
    | OnRouteChange Route.Route
    | SidebarMsg Sidebar.Msg
    | ColorsMsg Colors.Msg
    | TypographyMsg Typography.Msg


type alias Model =
    { route : Route.Route
    , routeKey : Nav.Key
    , sidebar : Sidebar
    , colorsModel : Colors.Model
    }


initialModel : Url -> Nav.Key -> Model
initialModel url key =
    { route =
        Route.routeFromUrl url
            |> Maybe.withDefault Route.Welcome
    , routeKey = key
    , sidebar = Sidebar.sidebar
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


updateColors : Colors.Model -> Model -> Model
updateColors colorsModel =
    updateModel (\m -> { m | colorsModel = colorsModel })


type alias Flags =
    {}

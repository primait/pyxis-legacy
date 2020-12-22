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
import Html
import Prima.Pyxis.Accordion as Accordion
import Pyxis.Model.Route as Route
import Pyxis.Model.Sidebar as Sidebar
import Pyxis.Model.Style.Colors as Colors
import Url exposing (Url)


type Msg
    = OnUrlChange Url
    | OnUrlRequest UrlRequest
    | OnRouteChange Route.Route
    | SidebarMsg Sidebar.Msg
    | ColorsMsg Colors.Msg


type alias Model =
    { route : Route.Route
    , routeKey : Nav.Key
    , sidebarModel : Sidebar.Model
    , colorsModel : Colors.Model
    }


initialModel : Nav.Key -> Model
initialModel key =
    { route = Route.Welcome
    , routeKey = key
    , sidebarModel = Sidebar.initialModel
    , colorsModel = Colors.initialModel
    }


updateModel : (Model -> Model) -> Model -> Model
updateModel mapper =
    mapper


updateRoute : Route.Route -> Model -> Model
updateRoute route =
    updateModel (\m -> { m | route = route })


updateSidebar : Sidebar.Model -> Model -> Model
updateSidebar sidebarModel =
    updateModel (\m -> { m | sidebarModel = sidebarModel })


updateColors : Colors.Model -> Model -> Model
updateColors colorsModel =
    updateModel (\m -> { m | colorsModel = colorsModel })


type alias Flags =
    {}

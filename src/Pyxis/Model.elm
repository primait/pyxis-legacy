module Pyxis.Model exposing
    ( Flags
    , Model
    , Msg(..)
    , initialModel
    , updateModel
    , updateRoute
    )

import Browser exposing (UrlRequest)
import Html
import Prima.Pyxis.Accordion as Accordion
import Pyxis.Model.Route as Route exposing (routeToLabel, routeToSlug)
import Pyxis.Model.Sidebar as Sidebar
import Url exposing (Url)


type Msg
    = OnUrlChange Url
    | OnUrlRequest UrlRequest
    | OnRouteChange Route.Route
    | SidebarMsg Sidebar.Msg


type alias Model =
    { route : Route.Route
    , sidebar : Sidebar.Model
    }


initialModel : Model
initialModel =
    { route = Route.Welcome
    , sidebar = Sidebar.initialModel
    }


updateModel : (Model -> Model) -> Model -> Model
updateModel mapper =
    mapper


updateRoute : Route.Route -> Model -> Model
updateRoute route =
    updateModel (\m -> { m | route = route })


type alias Flags =
    {}

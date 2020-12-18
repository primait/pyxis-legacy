module Pyxis.Model exposing (Flags, Model, Msg(..), initialModel)

import Browser exposing (UrlRequest)
import Pyxis.Model.Route as Route exposing (Route)
import Url exposing (Url)


type Msg
    = OnUrlChange Url
    | OnUrlRequest UrlRequest
    | OnRouteChange Route


type alias Model =
    { route : Route.Route }


initialModel : Model
initialModel =
    { route = Route.Welcome
    }


type alias Flags =
    {}

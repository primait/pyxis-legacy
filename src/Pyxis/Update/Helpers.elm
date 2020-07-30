module Pyxis.Update.Helpers exposing (..)

import Pyxis.Model exposing (Model)
import Pyxis.Router as Router exposing (Route(..))


updateRoute : Maybe Route -> Model -> Model
updateRoute maybeRoute model =
    { model | currentRoute = Maybe.withDefault Router.NotFound maybeRoute }

module Pyxis.Update exposing (update)

import Pyxis.Model exposing (Model, Msg(..), initialModel)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "update" msg of
        OnRouteChange route ->
            ( { model | route = route }, Cmd.none )

        _ ->
            ( model, Cmd.none )

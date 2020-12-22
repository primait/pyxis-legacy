module Pyxis.Update exposing (update)

import Maybe
import Prima.Pyxis.Accordion as Accordion
import Pyxis.Model exposing (Model, Msg(..), initialModel, updateModel, updateRoute)
import Pyxis.Model.Route as Route
import Pyxis.Model.Sidebar as Sidebar
import Pyxis.Update.Helpers as UH


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "update" msg of
        OnRouteChange route ->
            model
                |> updateRoute route
                |> UH.withoutCmds

        SidebarMsg sidebarMsg ->
            { model | sidebar = Tuple.first (Sidebar.update sidebarMsg model.sidebar) }
                |> UH.withoutCmds

        _ ->
            ( model, Cmd.none )

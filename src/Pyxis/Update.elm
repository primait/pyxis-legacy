module Pyxis.Update exposing (update)

import Pyxis.Components.Buttons.Model as ButtonsModel
import Pyxis.Components.Buttons.Update as ButtonsUpdate
import Pyxis.Components.Colors.Model as ColorsModel
import Pyxis.Components.Colors.Update as ColorsUpdate
import Pyxis.Components.Form.Model as FormModel
import Pyxis.Components.Form.Update as FormUpdate
import Pyxis.Components.Header.Model as HeaderModel
import Pyxis.Components.Header.Update as HeaderUpdate
import Pyxis.Helpers
    exposing
        ( addMessage
        , changeRoute
        , delayCmd
        , removeMessage
        , updateMenu
        , withCmds
        , withoutCmds
        )
import Pyxis.Model
    exposing
        ( Menu
        , Message
        , MessageType(..)
        , Model
        , Msg(..)
        , Route(..)
        )
import Pyxis.Routing exposing (parseLocation)
import Time exposing (Time)
import Unique exposing (Id, Unique)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "update" msg of
        LocationChange location ->
            { model
                | route = parseLocation location
                , menu = updateMenu (parseLocation location) model.menu
            }
                |> withoutCmds

        RouteUpdate route ->
            { model
                | route = route
                , menu = updateMenu route model.menu
            }
                |> withCmds [ changeRoute route ]

        ShowSource source ->
            { model | htmlSnippet = Just source } |> withoutCmds

        HideSource ->
            { model | htmlSnippet = Nothing } |> withoutCmds

        Copied ->
            let
                uuid =
                    Unique.unique

                duration =
                    Time.second * 2

                message =
                    Message uuid Default "Color hex copied!" duration
            in
            model |> addMessage message |> withCmds [ delayCmd duration (RemoveMessage uuid) ]

        AddMessage message ->
            model |> addMessage message |> withCmds [ delayCmd message.duration (RemoveMessage message.uuid) ]

        RemoveMessage uuid ->
            model |> removeMessage uuid |> withoutCmds

        ColorsMsg colorsMsg ->
            updateColors model colorsMsg model.colors

        ButtonsMsg buttonsMsg ->
            updateButtons model buttonsMsg model.buttons

        FormMsg formMsg ->
            updateForm model formMsg model.form

        HeaderMsg headerMsg ->
            updateHeader model headerMsg model.header


updateColors : Model -> ColorsModel.Msg -> ColorsModel.Model -> ( Model, Cmd Msg )
updateColors model msg colorsModel =
    let
        ( newColorsModel, cmds ) =
            ColorsUpdate.update msg colorsModel
    in
    { model | colors = newColorsModel } ! [ Cmd.map ColorsMsg cmds ]


updateButtons : Model -> ButtonsModel.Msg -> ButtonsModel.Model -> ( Model, Cmd Msg )
updateButtons model msg buttonsModel =
    let
        ( newButtonsModel, cmds ) =
            ButtonsUpdate.update msg buttonsModel
    in
    { model | buttons = newButtonsModel } ! [ Cmd.map ButtonsMsg cmds ]


updateForm : Model -> FormModel.Msg -> FormModel.Model -> ( Model, Cmd Msg )
updateForm model msg formModel =
    let
        ( newFormModel, cmds ) =
            FormUpdate.update msg formModel
    in
    { model | form = newFormModel } ! [ Cmd.map FormMsg cmds ]


updateHeader : Model -> HeaderModel.Msg -> HeaderModel.Model -> ( Model, Cmd Msg )
updateHeader model msg headerModel =
    let
        ( newHeaderModel, cmds ) =
            HeaderUpdate.update msg headerModel
    in
    { model | header = newHeaderModel } ! [ Cmd.map HeaderMsg cmds ]

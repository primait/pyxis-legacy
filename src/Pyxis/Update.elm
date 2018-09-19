module Pyxis.Update exposing (update)

import Pyxis.Components.Buttons.Model as ButtonsModel
import Pyxis.Components.Buttons.Update as ButtonsUpdate
import Pyxis.Components.Colors.Model as ColorsModel
import Pyxis.Components.Colors.Update as ColorsUpdate
import Pyxis.Components.Footer.Model as FooterModel
import Pyxis.Components.Footer.Update as FooterUpdate
import Pyxis.Components.Form.Model as FormModel
import Pyxis.Components.Form.Update as FormUpdate
import Pyxis.Components.Header.Model as HeaderModel
import Pyxis.Components.Header.Update as HeaderUpdate
import Pyxis.Components.Messages.Model as MessagesModel
import Pyxis.Components.Messages.Update as MessagesUpdate
import Pyxis.Components.Tooltips.Model as TooltipsModel
import Pyxis.Components.Tooltips.Update as TooltipsUpdate
import Pyxis.Helpers
    exposing
        ( addAppMessage
        , changeRoute
        , delayCmd
        , removeAppMessage
        , updateMenu
        , withCmds
        , withoutCmds
        )
import Pyxis.Model
    exposing
        ( AppMessage
        , AppMessageType(..)
        , Menu
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

                appMessage =
                    AppMessage uuid Default "Color hex copied!" duration
            in
            model |> addAppMessage appMessage |> withCmds [ delayCmd duration (RemoveAppMessage uuid) ]

        AddAppMessage appMessage ->
            model |> addAppMessage appMessage |> withCmds [ delayCmd appMessage.duration (RemoveAppMessage appMessage.uuid) ]

        RemoveAppMessage uuid ->
            model |> removeAppMessage uuid |> withoutCmds

        ColorsMsg colorsMsg ->
            updateColors model colorsMsg model.colors

        ButtonsMsg buttonsMsg ->
            updateButtons model buttonsMsg model.buttons

        FormMsg formMsg ->
            updateForm model formMsg model.form

        FooterMsg footerMsg ->
            updateFooter model footerMsg model.footer

        HeaderMsg headerMsg ->
            updateHeader model headerMsg model.header

        MessagesMsg messagesMsg ->
            updateMessages model messagesMsg model.messages

        TooltipsMsg tooltipsMsg ->
            updateTooltips model tooltipsMsg model.tooltips


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


updateFooter : Model -> FooterModel.Msg -> FooterModel.Model -> ( Model, Cmd Msg )
updateFooter model msg footerModel =
    let
        ( newFooterModel, cmds ) =
            FooterUpdate.update msg footerModel
    in
    { model | footer = newFooterModel } ! [ Cmd.map FooterMsg cmds ]


updateMessages : Model -> MessagesModel.Msg -> MessagesModel.Model -> ( Model, Cmd Msg )
updateMessages model msg messagesModel =
    let
        ( newMessagesModel, cmds ) =
            MessagesUpdate.update msg messagesModel
    in
    { model | messages = newMessagesModel } ! [ Cmd.map MessagesMsg cmds ]


updateTooltips : Model -> TooltipsModel.Msg -> TooltipsModel.Model -> ( Model, Cmd Msg )
updateTooltips model msg tooltipsModel =
    let
        ( newTooltipsModel, cmds ) =
            TooltipsUpdate.update msg tooltipsModel
    in
    { model | tooltips = newTooltipsModel } ! [ Cmd.map TooltipsMsg cmds ]

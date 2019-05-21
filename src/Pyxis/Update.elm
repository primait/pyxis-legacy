module Pyxis.Update exposing (update)

import Pyxis.Components.Accordions.Model as AccordionsModel
import Pyxis.Components.Accordions.Update as AccordionsUpdate
import Pyxis.Components.Buttons.Model as ButtonsModel
import Pyxis.Components.Buttons.Update as ButtonsUpdate
import Pyxis.Components.Colors.Model as ColorsModel
import Pyxis.Components.Colors.Update as ColorsUpdate
import Pyxis.Components.Form.Model as FormModel
import Pyxis.Components.Form.Update as FormUpdate
import Pyxis.Components.Jumbotron.Model as JumbotronModel
import Pyxis.Components.Jumbotron.Update as JumbotronUpdate
import Pyxis.Components.Lists.Model as ListsModel
import Pyxis.Components.Lists.Update as ListsUpdate
import Pyxis.Components.Loader.Model as LoaderModel
import Pyxis.Components.Loader.Update as LoaderUpdate
import Pyxis.Components.Login.Model as LoginModel
import Pyxis.Components.Login.Update as LoginUpdate
import Pyxis.Components.Messages.Model as MessagesModel
import Pyxis.Components.Messages.Update as MessagesUpdate
import Pyxis.Components.Table.Model as TableModel
import Pyxis.Components.Table.Update as TableUpdate
import Pyxis.Components.Tooltips.Model as TooltipsModel
import Pyxis.Components.Tooltips.Update as TooltipsUpdate
import Pyxis.Helpers
    exposing
        ( addAppMessage
        , changeRoute
        , delayCmd
        , removeAppMessage
        , updateMenu
        , urlInterceptor
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
import Pyxis.Router exposing (urlToRoute)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "update" msg of
        UrlRequested request ->
            urlInterceptor request model

        UrlChanged url ->
            let
                route =
                    urlToRoute url
            in
            { model
                | url = url
                , route = route
            }
                |> withoutCmds

        ShowSource source ->
            { model
                | htmlSnippet = Just source
            }
                |> withoutCmds

        HideSource ->
            { model
                | htmlSnippet = Nothing
            }
                |> withoutCmds

        Copied ->
            let
                slug =
                    "colorCopied"
            in
            model
                |> addAppMessage (AppMessage slug Default "Color hex copied!" 2000)
                |> withCmds [ delayCmd 2000 (RemoveAppMessage slug) ]

        RemoveAppMessage slug ->
            model
                |> removeAppMessage slug
                |> withoutCmds

        AccordionsMsg accordionsMsg ->
            updateAccordions model accordionsMsg model.accordions

        ButtonsMsg buttonsMsg ->
            updateButtons model buttonsMsg model.buttons

        ColorsMsg colorsMsg ->
            updateColors model colorsMsg model.colors

        FormMsg formMsg ->
            updateForm model formMsg model.form

        ListsMsg listsMsg ->
            updateLists model listsMsg model.lists

        LoaderMsg loaderMsg ->
            updateLoader model loaderMsg model.loader

        MessagesMsg messagesMsg ->
            updateMessages model messagesMsg model.messages

        TableMsg tableMsg ->
            updateTable model tableMsg model.table

        TooltipsMsg tooltipsMsg ->
            updateTooltips model tooltipsMsg model.tooltips

        LoginMsg loginMsg ->
            updateLogin model loginMsg model.login

        JumbotronMsg jumbotronMsg ->
            updateJumbotron model jumbotronMsg model.jumbotron


updateAccordions : Model -> AccordionsModel.Msg -> AccordionsModel.Model -> ( Model, Cmd Msg )
updateAccordions model msg accordionsModel =
    let
        ( newAccordionsModel, cmds ) =
            AccordionsUpdate.update msg accordionsModel
    in
    ( { model
        | accordions = newAccordionsModel
      }
    , Cmd.map AccordionsMsg cmds
    )


updateColors : Model -> ColorsModel.Msg -> ColorsModel.Model -> ( Model, Cmd Msg )
updateColors model msg colorsModel =
    let
        ( newColorsModel, cmds ) =
            ColorsUpdate.update msg colorsModel
    in
    ( { model
        | colors = newColorsModel
      }
    , Cmd.map ColorsMsg cmds
    )


updateButtons : Model -> ButtonsModel.Msg -> ButtonsModel.Model -> ( Model, Cmd Msg )
updateButtons model msg buttonsModel =
    let
        ( newButtonsModel, cmds ) =
            ButtonsUpdate.update msg buttonsModel
    in
    ( { model
        | buttons = newButtonsModel
      }
    , Cmd.map ButtonsMsg cmds
    )


updateForm : Model -> FormModel.Msg -> FormModel.Model -> ( Model, Cmd Msg )
updateForm model msg formModel =
    let
        ( newFormModel, cmds ) =
            FormUpdate.update msg formModel
    in
    ( { model
        | form = newFormModel
      }
    , Cmd.map FormMsg cmds
    )


updateLists : Model -> ListsModel.Msg -> ListsModel.Model -> ( Model, Cmd Msg )
updateLists model msg listsModel =
    let
        ( newListsModel, cmds ) =
            ListsUpdate.update msg listsModel
    in
    ( { model
        | lists = newListsModel
      }
    , Cmd.map ListsMsg cmds
    )


updateLoader : Model -> LoaderModel.Msg -> LoaderModel.Model -> ( Model, Cmd Msg )
updateLoader model msg loaderModel =
    let
        ( newLoaderModel, cmds ) =
            LoaderUpdate.update msg loaderModel
    in
    ( { model
        | loader = newLoaderModel
      }
    , Cmd.map LoaderMsg cmds
    )


updateMessages : Model -> MessagesModel.Msg -> MessagesModel.Model -> ( Model, Cmd Msg )
updateMessages model msg messagesModel =
    let
        ( newMessagesModel, cmds ) =
            MessagesUpdate.update msg messagesModel
    in
    ( { model
        | messages = newMessagesModel
      }
    , Cmd.map MessagesMsg cmds
    )


updateTable : Model -> TableModel.Msg -> TableModel.Model -> ( Model, Cmd Msg )
updateTable model msg tableModel =
    let
        ( newTableModel, cmds ) =
            TableUpdate.update msg tableModel
    in
    ( { model
        | table = newTableModel
      }
    , Cmd.map TableMsg cmds
    )


updateTooltips : Model -> TooltipsModel.Msg -> TooltipsModel.Model -> ( Model, Cmd Msg )
updateTooltips model msg tooltipsModel =
    let
        ( newTooltipsModel, cmds ) =
            TooltipsUpdate.update msg tooltipsModel
    in
    ( { model
        | tooltips = newTooltipsModel
      }
    , Cmd.map TooltipsMsg cmds
    )


updateLogin : Model -> LoginModel.Msg -> LoginModel.Model -> ( Model, Cmd Msg )
updateLogin model msg loginModel =
    let
        ( newLoginModel, cmds ) =
            LoginUpdate.update msg loginModel
    in
    ( { model
        | login = newLoginModel
      }
    , Cmd.map LoginMsg cmds
    )


updateJumbotron : Model -> JumbotronModel.Msg -> JumbotronModel.Model -> ( Model, Cmd Msg )
updateJumbotron model msg jumbotronModel =
    let
        ( newJumbotronModel, cmds ) =
            JumbotronUpdate.update msg jumbotronModel
    in
    ( { model
        | jumbotron = newJumbotronModel
      }
    , Cmd.map JumbotronMsg cmds
    )

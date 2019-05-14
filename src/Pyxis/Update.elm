module Pyxis.Update exposing (update)

import Pyxis.Components.Accordions.Model as AccordionsModel
import Pyxis.Components.Accordions.Update as AccordionsUpdate
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
            {--let
                uuid =
                    Unique.unique


                appMessage =
                    AppMessage uuid Default "Color hex copied!" duration
            in--}
            model
                --|> addAppMessage appMessage
                -- |> withCmds [ delayCmd 2000 (RemoveAppMessage uuid) ]
                |> withoutCmds

        AddAppMessage appMessage ->
            model
                |> addAppMessage appMessage
                |> withCmds [ delayCmd appMessage.duration (RemoveAppMessage appMessage.uuid) ]

        RemoveAppMessage uuid ->
            model
                |> removeAppMessage uuid
                |> withoutCmds

        AccordionsMsg accordionsMsg ->
            updateAccordions model accordionsMsg model.accordions

        ButtonsMsg buttonsMsg ->
            updateButtons model buttonsMsg model.buttons

        ColorsMsg colorsMsg ->
            updateColors model colorsMsg model.colors

        FooterMsg footerMsg ->
            updateFooter model footerMsg model.footer

        FormMsg formMsg ->
            updateForm model formMsg model.form

        ListsMsg listsMsg ->
            updateLists model listsMsg model.lists

        HeaderMsg headerMsg ->
            updateHeader model headerMsg model.header

        LoaderMsg loaderMsg ->
            updateLoader model loaderMsg model.loader

        MessagesMsg messagesMsg ->
            updateMessages model messagesMsg model.messages

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


updateHeader : Model -> HeaderModel.Msg -> HeaderModel.Model -> ( Model, Cmd Msg )
updateHeader model msg headerModel =
    let
        ( newHeaderModel, cmds ) =
            HeaderUpdate.update msg headerModel
    in
    ( { model
        | header = newHeaderModel
      }
    , Cmd.map HeaderMsg cmds
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


updateFooter : Model -> FooterModel.Msg -> FooterModel.Model -> ( Model, Cmd Msg )
updateFooter model msg footerModel =
    let
        ( newFooterModel, cmds ) =
            FooterUpdate.update msg footerModel
    in
    ( { model
        | footer = newFooterModel
      }
    , Cmd.map FooterMsg cmds
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

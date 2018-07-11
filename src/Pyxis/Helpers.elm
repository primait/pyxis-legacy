module Pyxis.Helpers exposing (..)

import Date
    exposing
        ( Date
        , Day(..)
        , Month(..)
        )
import Date.Format
import DatePicker exposing (DatePicker)
import Navigation exposing (Location)
import Process
import Pyxis.Model
    exposing
        ( Menu
        , Message
        , MessageType(..)
        , Model
        , Route(..)
        )
import Task
import Time exposing (Time)
import Unique exposing (Id, Unique)


withoutCmds : model -> ( model, Cmd msg )
withoutCmds model =
    ( model, Cmd.none )


withCmd : Cmd msg -> model -> ( model, Cmd msg )
withCmd cmd model =
    ( model, cmd )


withCmds : List (Cmd msg) -> model -> ( model, Cmd msg )
withCmds cmd model =
    ( model, Cmd.batch cmd )


toMaybeCmd : (a -> Cmd msg) -> Maybe a -> Maybe (Cmd msg)
toMaybeCmd mapper something =
    Maybe.map mapper something


maybeToCmd : Maybe (Cmd msg) -> Cmd msg
maybeToCmd cmd =
    Maybe.withDefault Cmd.none cmd


sendCmdMsg : msg -> Cmd msg
sendCmdMsg =
    Task.perform identity << Task.succeed


delayCmd : Time -> msg -> Cmd msg
delayCmd time msg =
    Process.sleep time
        |> Task.andThen (Task.succeed msg |> always)
        |> Task.perform identity


changeRoute : Route -> Cmd msg
changeRoute =
    Navigation.newUrl << routeToUrl


routeToUrl : Route -> String
routeToUrl route =
    case route of
        ButtonsRoute ->
            "/buttons"

        ColorsRoute ->
            "/colors"

        FooterRoute ->
            "/footer"

        FormRoute ->
            "/form"

        HeaderRoute ->
            "/header"

        HomeRoute ->
            "/"

        TypographyRoute ->
            "/typography"

        NotFoundRoute ->
            "/"


formatDate : String -> Maybe Date -> String
formatDate dateFormat date =
    Maybe.map (Date.Format.format dateFormat) date |> Maybe.withDefault ""


datepickerSettings : DatePicker.Settings
datepickerSettings =
    let
        settings =
            DatePicker.defaultSettings
    in
    { settings
        | dateFormatter = formatDate "%d/%m/%Y" << Just
        , dayFormatter = dayFormatter
        , monthFormatter = monthFormatter
        , firstDayOfWeek = Mon
        , placeholder = "gg / mm / aaaa"
        , classNamespace = "a-form__field__datepicker__"
        , inputClassList =
            [ ( "a-form__field__input", True )
            , ( "a-form__field__input--datepicker", True )
            ]
        , changeYear = DatePicker.between 1900 2020
    }


dayFormatter : Day -> String
dayFormatter day =
    case day of
        Mon ->
            "Lun"

        Tue ->
            "Mar"

        Wed ->
            "Mer"

        Thu ->
            "Gio"

        Fri ->
            "Ven"

        Sat ->
            "Sab"

        Sun ->
            "Dom"


monthFormatter : Month -> String
monthFormatter month =
    case month of
        Jan ->
            "Gennaio"

        Feb ->
            "Febbraio"

        Mar ->
            "Marzo"

        Apr ->
            "Aprile"

        May ->
            "Maggio"

        Jun ->
            "Giugno"

        Jul ->
            "Luglio"

        Aug ->
            "Agosto"

        Sep ->
            "Settembre"

        Oct ->
            "Ottobre"

        Nov ->
            "Novembre"

        Dec ->
            "Dicembre"


updateMenu : Route -> List Menu -> List Menu
updateMenu route menu =
    let
        activateByRoute : Route -> Menu -> Menu
        activateByRoute route menu =
            { menu | isActive = menu.route == route }
    in
    List.map (activateByRoute route) menu


addMessage : Message -> Model -> Model
addMessage msg model =
    { model | messages = msg :: model.messages }


removeMessage : Unique Id -> Model -> Model
removeMessage uuid model =
    { model | messages = List.filter (not << (==) uuid << .uuid) model.messages }


toInspectableSelector : String -> String
toInspectableSelector selector =
    "pyInspect pyInspect--" ++ selector

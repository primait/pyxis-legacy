module Pyxis.Helpers exposing (..)

import Date exposing (Date, Day(..), Month(..))
import Date.Format
import DatePicker exposing (DatePicker)
import Html exposing (..)
import Navigation exposing (Location)
import Pyxis.Model exposing (Route(..))
import Task


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


changeRoute : Route -> Cmd msg
changeRoute =
    Navigation.newUrl << routeToUrl


routeToUrl : Route -> String
routeToUrl route =
    case route of
        HomeRoute ->
            "/"

        FormRoute ->
            "/form"

        _ ->
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
        , inputClassList =
            [ ( "form__field__input", True )
            , ( "form__field__input--datepicker", True )
            ]
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


renderOrNothing : Maybe (Html msg) -> Html msg
renderOrNothing maybeHtml =
    Maybe.withDefault (text "") maybeHtml

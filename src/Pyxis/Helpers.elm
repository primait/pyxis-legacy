module Pyxis.Helpers exposing (..)

import Date
    exposing
        ( Date
        , Day(..)
        , Month(..)
        )
import Date.Format
import Navigation exposing (Location)
import Process
import Pyxis.Model
    exposing
        ( AppMessage
        , AppMessageType(..)
        , Menu
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

        LoginRoute ->
            "/login"

        LoaderRoute ->
            "/loader"

        MessagesRoute ->
            "/messages"

        HomeRoute ->
            "/"

        TooltipsRoute ->
            "/tooltips"

        TypographyRoute ->
            "/typography"

        NotFoundRoute ->
            "/"


formatDate : String -> Maybe Date -> String
formatDate dateFormat date =
    (Maybe.withDefault "" << Maybe.map (Date.Format.format dateFormat)) date


updateMenu : Route -> List Menu -> List Menu
updateMenu route menu =
    let
        activateByRoute : Route -> Menu -> Menu
        activateByRoute route menu =
            { menu | isActive = menu.route == route }
    in
    List.map (activateByRoute route) menu


addAppMessage : AppMessage -> Model -> Model
addAppMessage msg model =
    { model | appMessages = msg :: model.appMessages }


removeAppMessage : Unique Id -> Model -> Model
removeAppMessage uuid model =
    { model | appMessages = List.filter (not << (==) uuid << .uuid) model.appMessages }


toInspectableSelector : String -> String
toInspectableSelector selector =
    "pyInspect pyInspect--" ++ selector


capitalize : String -> String
capitalize str =
    case String.split "" str of
        head :: tail ->
            (String.join "" << (::) (String.toUpper head)) tail

        _ ->
            str

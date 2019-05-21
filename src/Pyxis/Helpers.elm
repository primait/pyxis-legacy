module Pyxis.Helpers exposing
    ( addAppMessage
    , capitalize
    , changeRoute
    , delayCmd
    , maybeToCmd
    , picture
    , removeAppMessage
    , sendCmdMsg
    , toInspectableSelector
    , toMaybeCmd
    , updateMenu
    , urlInterceptor
    , withCmd
    , withCmds
    , withoutCmds
    )

import Browser exposing (..)
import Browser.Navigation as Nav
import Html exposing (Attribute, Html, node)
import Process
import Pyxis.Model
    exposing
        ( AppMessage
        , AppMessageType(..)
        , Menu
        , Model
        , Msg(..)
        , Route(..)
        , initialModel
        )
import Pyxis.Router as Router
import Task
import Url


withoutCmds : model -> ( model, Cmd msg )
withoutCmds model =
    ( model, Cmd.none )


withCmd : Cmd msg -> model -> ( model, Cmd msg )
withCmd cmd model =
    ( model, cmd )


withCmds : List (Cmd msg) -> model -> ( model, Cmd msg )
withCmds cmd model =
    ( model, Cmd.batch cmd )


urlInterceptor : UrlRequest -> Model -> ( Model, Cmd Msg )
urlInterceptor request model =
    case request of
        Internal url ->
            model
                |> withCmds [ (Nav.pushUrl model.key << Url.toString) url ]

        External url ->
            model
                |> withCmds [ Nav.load url ]


toMaybeCmd : (a -> Cmd msg) -> Maybe a -> Maybe (Cmd msg)
toMaybeCmd mapper something =
    Maybe.map mapper something


maybeToCmd : Maybe (Cmd msg) -> Cmd msg
maybeToCmd cmd =
    Maybe.withDefault Cmd.none cmd


sendCmdMsg : msg -> Cmd msg
sendCmdMsg =
    Task.perform identity << Task.succeed


delayCmd : Float -> msg -> Cmd msg
delayCmd duration msg =
    duration
        |> Process.sleep
        |> Task.andThen (Task.succeed msg |> always)
        |> Task.perform identity


changeRoute : Route -> Cmd Msg
changeRoute route =
    route
        |> Router.routeToString
        |> Url.fromString
        |> Maybe.map (sendCmdMsg << UrlRequested << Internal)
        |> Maybe.withDefault Cmd.none


updateMenu : Route -> List Menu -> List Menu
updateMenu route menu =
    List.map (\m -> { m | isActive = m.route == route }) menu


addAppMessage : AppMessage -> Model -> Model
addAppMessage msg model =
    { model | appMessages = msg :: model.appMessages }


removeAppMessage : String -> Model -> Model
removeAppMessage slug model =
    { model | appMessages = List.filter (not << (==) slug << .slug) model.appMessages }


toInspectableSelector : String -> String
toInspectableSelector selector =
    "pyInspect pyInspect--" ++ selector


picture : List (Attribute msg) -> List (Html msg) -> Html msg
picture attributes children =
    node "picture" attributes children


capitalize : String -> String
capitalize str =
    case String.split "" str of
        head :: tail ->
            (String.join "" << (::) (String.toUpper head)) tail

        _ ->
            str

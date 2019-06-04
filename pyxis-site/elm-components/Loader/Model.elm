module Loader.Model exposing
    ( Flags
    , LoaderType(..)
    , Model
    , Msg(..)
    , initialModel
    , loaderTypeFromString
    , loaderTypeToConfiguration
    )

import Html exposing (..)
import Prima.Pyxis.Loader as Loader
import Pyxis.Helpers as Helpers


type Msg
    = NoOp


type alias Model =
    { loaderList : List LoaderType
    }


initialModel : Model
initialModel =
    Model []


type LoaderType
    = Spinner
    | Vehicle


loaderTypeFromString : String -> Maybe LoaderType
loaderTypeFromString str =
    case String.toLower str of
        "spinner" ->
            Just Spinner

        "vehicle" ->
            Just Vehicle

        _ ->
            Nothing


loaderTypeToConfiguration : LoaderType -> Loader.Config
loaderTypeToConfiguration type_ =
    case type_ of
        Spinner ->
            loaderSpinner

        Vehicle ->
            loaderVehicle


loaderVehicle : Loader.Config
loaderVehicle =
    Loader.vehicle (Just "Attendi. Stiamo caricando i tuoi dati...")


loaderSpinner : Loader.Config
loaderSpinner =
    Loader.spinner Loader.medium (Just "Attendi. Stiamo caricando i tuoi dati...")


type alias Flags =
    { loaderType : String
    }

module Loader.View exposing (view)

import Html exposing (..)
import Loader.Model
    exposing
        ( LoaderType(..)
        , Model
        , Msg(..)
        , loaderTypeToConfiguration
        )
import Prima.Pyxis.Loader as Loader
import Pyxis.Helpers as Helpers


view : Model -> Html Msg
view model =
    div
        []
        [ (Helpers.syntaxWrapper << List.map (Loader.render << loaderTypeToConfiguration)) model.loaderList
        ]

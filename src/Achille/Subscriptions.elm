module Achille.Subscriptions exposing (subscriptions)

import Achille.Model
    exposing
        ( Model
        , Msg(..)
        )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch []

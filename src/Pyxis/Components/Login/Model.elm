module Pyxis.Components.Login.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        , initialModel
        )


type Msg
    = FormNoOp
    | Focus Field
    | Blur Field
    | UpdateText Field (Maybe String)
    | InspectHtml String


type alias Model =
    { emailField : Maybe String
    , passwordField : Maybe String
    , canBeSubmitted : Bool
    }


type Field
    = Email
    | Password


initialModel : Model
initialModel =
    Model
        Nothing
        Nothing
        False

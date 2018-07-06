module Pyxis.Components.Buttons.Model
    exposing
        ( Btn
        , BtnType(..)
        , Model
        , Msg(..)
        , btnTypeToString
        , initialModel
        )


type Msg
    = EnableBtn BtnType
    | DisableBtn BtnType
      ---------------------
    | InspectHtml String


type alias Model =
    { buttons : List Btn
    }


initialModel : Model
initialModel =
    Model
        [ Btn Primary "Primary action" False
        , Btn Secondary "Secondary action" False
        , Btn Tertiary "Tertiary action" False
        ]


type alias Btn =
    { type_ : BtnType
    , label : String
    , isDisabled : Bool
    }


type BtnType
    = Primary
    | Secondary
    | Tertiary


btnTypeToString : BtnType -> String
btnTypeToString type_ =
    case type_ of
        Primary ->
            "primary"

        Secondary ->
            "secondary"

        Tertiary ->
            "tertiary"

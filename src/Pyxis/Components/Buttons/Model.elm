module Pyxis.Components.Buttons.Model exposing
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
        [ Btn Primary "Primary action" Nothing False
        , Btn Secondary "Secondary action" Nothing False
        , Btn Tertiary "Tertiary action" Nothing False
        , Btn Circle "" (Just "icon-mark") False
        ]


type alias Btn =
    { type_ : BtnType
    , label : String
    , icon : Maybe String
    , isDisabled : Bool
    }


type BtnType
    = Primary
    | Secondary
    | Tertiary
    | Circle


btnTypeToString : BtnType -> String
btnTypeToString type_ =
    case type_ of
        Primary ->
            "primary"

        Secondary ->
            "secondary"

        Tertiary ->
            "tertiary"

        Circle ->
            "circle"

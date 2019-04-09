module Pyxis.Components.Buttons.Model
    exposing
        ( Btn
        , BtnType(..)
        , Model
        , Msg(..)
        , attentionBtn
        , btnTypeToString
        , circleBtn
        , initialModel
        , primaryBtn
        , secondaryBtn
        , tertiaryBtn
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
        [ circleBtn
        , primaryBtn
        , secondaryBtn
        , tertiaryBtn
        , attentionBtn
        ]


primaryBtn : Btn
primaryBtn =
    Btn Primary "Primary action" Nothing False


secondaryBtn : Btn
secondaryBtn =
    Btn Secondary "Secondary action" Nothing False


tertiaryBtn : Btn
tertiaryBtn =
    Btn Tertiary "Tertiary action" Nothing False


attentionBtn : Btn
attentionBtn =
    Btn Attention "Attention action" (Just "lock") False


circleBtn : Btn
circleBtn =
    Btn Circle "" (Just "caret-down") False


type alias Btn =
    { type_ : BtnType
    , label : String
    , icon : Maybe String
    , isDisabled : Bool
    }


type BtnType
    = Circle
    | Primary
    | Secondary
    | Tertiary
    | Attention


btnTypeToString : BtnType -> String
btnTypeToString type_ =
    case type_ of
        Circle ->
            "circle"

        Primary ->
            "primary"

        Secondary ->
            "secondary"

        Tertiary ->
            "tertiary"

        Attention ->
            "attention"

module Button.Model exposing
    ( Btn
    , BtnType(..)
    , Flags
    , Model
    , Msg(..)
    , btnTypeFromString
    , initialModel
    )

import Html exposing (..)
import Prima.Pyxis.Button as Button
import Pyxis.Helpers as Helpers


type Msg
    = NoOp


type alias Model =
    { buttons : List Btn
    }


initialModel : Model
initialModel =
    Model
        [ Btn CallOut <| Button.callOut Button.Brand "Call out" NoOp
        , Btn CallOutSmall <| Button.callOutSmall Button.Brand "Call out small" NoOp
        , Btn CallOutDark <| Button.callOut Button.BrandDark "Call out dark" NoOp
        , Btn CallOutDarkSmall <| Button.callOutSmall Button.BrandDark "Call out dark small" NoOp
        , Btn Primary <| Button.primary Button.Brand "Primary" NoOp
        , Btn PrimarySmall <| Button.primarySmall Button.Brand "Primary small" NoOp
        , Btn PrimaryDark <| Button.primary Button.BrandDark "Primary dark" NoOp
        , Btn PrimaryDarkSmall <| Button.primarySmall Button.BrandDark "Primary dark small" NoOp
        , Btn Secondary <| Button.secondary Button.Brand "Secondary" NoOp
        , Btn SecondarySmall <| Button.secondarySmall Button.Brand "Secondary small" NoOp
        , Btn SecondaryDark <| Button.secondary Button.BrandDark "Secondary dark" NoOp
        , Btn SecondaryDarkSmall <| Button.secondarySmall Button.BrandDark "Secondary dark small" NoOp
        , Btn Tertiary <| Button.tertiary Button.Brand "Tertiary" NoOp
        , Btn TertiarySmall <| Button.tertiarySmall Button.Brand "Tertiary small" NoOp
        , Btn TertiaryDark <| Button.tertiary Button.BrandDark "Tertiary dark" NoOp
        , Btn TertiaryDarkSmall <| Button.tertiarySmall Button.BrandDark "Tertiary dark small" NoOp
        ]


type alias Btn =
    { type_ : BtnType
    , config : Button.Config Msg
    }


type BtnType
    = CallOut
    | CallOutSmall
    | CallOutDark
    | CallOutDarkSmall
    | Primary
    | PrimarySmall
    | PrimaryDark
    | PrimaryDarkSmall
    | Secondary
    | SecondarySmall
    | SecondaryDark
    | SecondaryDarkSmall
    | Tertiary
    | TertiarySmall
    | TertiaryDark
    | TertiaryDarkSmall


btnTypeFromString : String -> Maybe BtnType
btnTypeFromString str =
    case String.toLower str of
        "call_out" ->
            Just CallOut

        "call_out_small" ->
            Just CallOutSmall

        "call_out_dark" ->
            Just CallOutDark

        "call_out_dark_small" ->
            Just CallOutDarkSmall

        "primary" ->
            Just Primary

        "primary_small" ->
            Just PrimarySmall

        "primary_dark" ->
            Just PrimaryDark

        "primary_dark_small" ->
            Just PrimaryDarkSmall

        "secondary" ->
            Just Secondary

        "secondary_small" ->
            Just SecondarySmall

        "secondary_dark" ->
            Just SecondaryDark

        "secondary_dark_small" ->
            Just SecondaryDarkSmall

        "tertiary" ->
            Just Tertiary

        "tertiary_small" ->
            Just TertiarySmall

        "tertiary_dark" ->
            Just TertiaryDark

        "tertiary_dark_small" ->
            Just TertiaryDarkSmall

        _ ->
            Nothing


type alias Flags =
    { buttonType : String
    }

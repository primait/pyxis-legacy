module Pages.Badge.Model exposing (BadgeType(..), Model, Msg(..), badgeToCssClass, init)

import Dict
import Pages.Component exposing (WithCodeInspectors)


type Msg
    = NoOp
    | ToggleInspect String Bool


type alias Model =
    WithCodeInspectors {}


init : Model
init =
    { inspectMode = Dict.empty
    }


type BadgeType
    = Primary
    | PrimaryAlt
    | Info
    | InfoAlt
    | Success
    | SuccessAlt
    | Warning
    | WarningAlt
    | Danger
    | DangerAlt


badgeToCssClass : BadgeType -> String
badgeToCssClass type_ =
    case type_ of
        Primary ->
            "badge--primary"

        PrimaryAlt ->
            "badge--primary-alt"

        Info ->
            "badge--info"

        InfoAlt ->
            "badge--info-alt"

        Success ->
            "badge--success"

        SuccessAlt ->
            "badge--success-alt"

        Warning ->
            "badge--warning"

        WarningAlt ->
            "badge--warning-alt"

        Danger ->
            "badge--danger"

        DangerAlt ->
            "badge--danger-alt"

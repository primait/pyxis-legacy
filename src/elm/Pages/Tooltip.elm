module Pages.Tooltip exposing
    ( Model
    , Msg(..)
    , init
    , update
    , view
    )

import Dict
import Helpers as H
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)


type alias Model =
    WithCodeInspectors {}


init : Model
init =
    { inspectMode = Dict.empty
    }



-- UPDATE


type Msg
    = NoOp
    | ToggleInspect String Bool


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model
                |> H.withoutCmds

        ToggleInspect id isActive ->
            model
                |> ComponentPage.toggleInspect id isActive
                |> H.withoutCmds



-- VIEW


view : Model -> Html Msg
view _ =
    div [ class "tooltip-page" ]
        [ ComponentPage.view
            { title = "Tooltip"
            , description = "Page under construction"
            , specs = Nothing
            , sections = []
            }
        ]

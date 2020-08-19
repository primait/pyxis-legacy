module Pages.Form exposing
    ( Model
    , Msg(..)
    , init
    , update
    , view
    )

import Dict exposing (Dict)
import Helpers as H
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage


type alias Model =
    Dict String String


init : Model
init =
    Dict.empty



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model
                |> H.withoutCmds



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "form-page" ]
        [ ComponentPage.view
            { title = "Form"
            , description = "Page under construction"
            , specs = Nothing
            , sections = []
            }
        ]

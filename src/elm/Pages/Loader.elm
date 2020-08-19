module Pages.Loader exposing (Model, Msg, init, update, view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Dict
import Helpers as H exposing (Translator, WithTranslator)
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage exposing (WithCodeInspectors)
import Prima.Pyxis.Loader as PyxisLoader


type alias Model =
    WithCodeInspectors (WithTranslator {})


init : Translator -> Model
init translate =
    { inspectMode = Dict.empty
    , translate = translate
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


isInspectModeActive : String -> Model -> Bool
isInspectModeActive id model =
    ComponentPage.isInspecting id model



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "loader-page" ]
        [ ComponentPage.view (pageConfig model) ]


pageConfig : Model -> ComponentPage.ViewConfig Msg
pageConfig model =
    { title = "Loader"
    , description = ""
    , specs = Nothing
    , sections = [ mainSection model ]
    }


mainSection : Model -> ComponentPage.SectionViewConfig Msg
mainSection model =
    { title = ""
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { id = "loader-vehicle"
            , isCodeVisible = isInspectModeActive "loader-vehicle" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "loader vehicle"
            , onTogglePreview = ToggleInspect
            }
            [ loaderVehicle "Attendi. Stiamo caricando i tuoi dati..."
            ]
        , ComponentViewer.view
            { id = "spinner-small"
            , isCodeVisible = isInspectModeActive "spinner-small" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "spinner small"
            , onTogglePreview = ToggleInspect
            }
            [ loaderSpinnerSmall
            ]
        , ComponentViewer.view
            { id = "spinner-medium"
            , isCodeVisible = isInspectModeActive "spinner-medium" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "spinner medium"
            , onTogglePreview = ToggleInspect
            }
            [ loaderSpinnerMedium "Attendi. Stiamo caricando i tuoi dati..."
            ]
        ]
    }


loaderVehicle : String -> Html Msg
loaderVehicle loadingText =
    PyxisLoader.vehicle
        |> PyxisLoader.withText loadingText
        |> PyxisLoader.render


loaderSpinnerSmall : Html Msg
loaderSpinnerSmall =
    PyxisLoader.spinner
        |> PyxisLoader.withSmallSize
        |> PyxisLoader.render


loaderSpinnerMedium : String -> Html Msg
loaderSpinnerMedium loadingText =
    PyxisLoader.spinner
        |> PyxisLoader.withText loadingText
        |> PyxisLoader.withMediumSize
        |> PyxisLoader.render

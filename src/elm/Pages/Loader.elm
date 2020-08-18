module Pages.Loader exposing (Model, Msg, init, update, view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Dict exposing (Dict)
import Helpers exposing (Translator)
import Html exposing (Html, div)
import Html.Attributes exposing (class, classList)
import Pages.Component as ComponentPage
import Prima.Pyxis.Loader as PyxisLoader



-- MODEL


type alias Model =
    { translate : Translator
    , data : Dict String String
    }


init : Translator -> Model
init translate =
    { translate = translate
    , data = Dict.empty
    }



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "loader-page" ]
        [ ComponentPage.view (pageConfig model) ]


pageConfig : Model -> ComponentPage.ViewConfig Msg
pageConfig ({ translate } as config) =
    { title = "Loader"
    , description = "..."
    , specsList =
        [ "..."
        ]
    , viewComponent = \_ -> componentPreview
    , sections = [ section ]
    }


componentPreview : Html Msg
componentPreview =
    loaderSpinnerMedium "Loading Text..."


section : ComponentPage.SectionViewConfig Msg
section =
    { title = ""
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Light
            , example = """TODO"""
            , label = "loader vehicle"
            , onTogglePreview = always NoOp
            }
            [ loaderVehicle "Attendi. Stiamo caricando i tuoi dati..."
            ]
        , ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Light
            , example = """TODO"""
            , label = "spinner small"
            , onTogglePreview = always NoOp
            }
            [ loaderSpinnerSmall
            ]
        , ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Light
            , example = """TODO"""
            , label = "spinner medium"
            , onTogglePreview = always NoOp
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

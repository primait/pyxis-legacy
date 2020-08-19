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
    , inspectMode : Dict String Bool
    }


init : Translator -> Model
init translate =
    { translate = translate
    , data = Dict.empty
    , inspectMode = Dict.empty
    }



-- UPDATE


type Msg
    = NoOp
    | ToggleInspect String Bool


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleInspect id isOpen ->
            ( { model
                | inspectMode =
                    model.inspectMode
                        |> Dict.insert id isOpen
              }
            , Cmd.none
            )



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
            { id = "loader-vehicle"
            , isCodeVisible = False
            , boxType = Box.Light
            , example = """TODO"""
            , label = "loader vehicle"
            , onTogglePreview = ToggleInspect
            }
            [ loaderVehicle "Attendi. Stiamo caricando i tuoi dati..."
            ]
        , ComponentViewer.view
            { id = "spinner-small"
            , isCodeVisible = False
            , boxType = Box.Light
            , example = """TODO"""
            , label = "spinner small"
            , onTogglePreview = ToggleInspect
            }
            [ loaderSpinnerSmall
            ]
        , ComponentViewer.view
            { id = "spinner-medium"
            , isCodeVisible = False
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

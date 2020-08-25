module Pages.Loader exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage
import Pages.Loader.Model as M exposing (Model, Msg(..))
import Prima.Pyxis.Loader as PyxisLoader


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
            , isCodeVisible = M.isInspectModeActive "loader-vehicle" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "loader vehicle"
            , onTogglePreview = ToggleInspect
            }
            [ loaderVehicle "Attendi. Stiamo caricando i tuoi dati..."
            ]
        , ComponentViewer.view
            { id = "spinner-small"
            , isCodeVisible = M.isInspectModeActive "spinner-small" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "spinner small"
            , onTogglePreview = ToggleInspect
            }
            [ loaderSpinnerSmall
            ]
        , ComponentViewer.view
            { id = "spinner-medium"
            , isCodeVisible = M.isInspectModeActive "spinner-medium" model
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

module View exposing (view)

import Browser exposing (Document)
import Commons.NavBar as NavBar
import Html exposing (Html, div, footer, img, span, text)
import Html.Attributes exposing (class, classList, src)
import Model exposing (Model, Msg(..))
import Pages.Accordion as Accordion
import Pages.Button as Button
import Pages.Home as Home
import Pages.NotFound as NotFound
import Route


view : Model -> Document Msg
view model =
    { title = "Pyxis"
    , body =
        [ viewBody model
        ]
    }


viewBody : Model -> Html Msg
viewBody model =
    div
        [ class "pyxis" ]
        [ div
            [ class "pyxis__navbar", classList [ ( "pyxis__navbar--open", model.isMenuOpen ) ] ]
            [ NavBar.view model ]
        , div
            [ class "pyxis__content" ]
            [ div
                [ class "pyxis-page" ]
                [ div
                    [ class "pyxis-page__content" ]
                    [ viewRouter model ]
                , footer [ class "pyxis-page__footer" ]
                    [ viewBrandLogo ]
                ]
            ]
        ]


viewBrandLogo : Html Msg
viewBrandLogo =
    div
        [ class "brand-logo" ]
        [ img
            [ class "brand-logo__image"
            , src "public/logo-prima.svg"
            ]
            []
        , span
            [ class "brand-logo__label" ]
            [ text "© Prima Assicurazioni S.p.A." ]
        ]


viewRouter : Model -> Html Msg
viewRouter model =
    case model.currentRoute of
        Route.Homepage ->
            Home.view model

        Route.Accordion ->
            Html.map AccordionMsg <| Accordion.view model.accordionModel

        Route.Button ->
            Html.map ButtonMsg <| Button.view model.buttonModel

        Route.NotFound ->
            NotFound.view

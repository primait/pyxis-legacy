module View exposing (view)

import Browser exposing (Document)
import Commons.Menu as Menu
import Html exposing (Html, div)
import Html.Attributes exposing (class, style)
import Model exposing (Model, Msg(..))
import Pages.Accordion as Accordion
import Pages.Button as Button
import Pages.Home as Home
import Pages.NotFound as NotFound
import Router


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
        [ Menu.view model
        , div [ class "pyxis-content" ]
            [ div [ style "padding" "16px" ] [ viewRouter model ] ]
        ]


viewRouter : Model -> Html Msg
viewRouter model =
    case model.currentRoute of
        Router.Homepage ->
            Home.view model

        Router.Accordion ->
            Html.map AccordionMsg <| Accordion.view model.accordionModel

        Router.Button ->
            Html.map ButtonMsg <| Button.view model.buttonModel

        Router.NotFound ->
            NotFound.view

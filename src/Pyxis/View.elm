module Pyxis.View exposing (..)

import Browser exposing (Document)
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pyxis.Commons.Menu as Menu
import Pyxis.Model exposing (Model, Msg(..))
import Pyxis.Pages.Accordion as Accordion
import Pyxis.Pages.Home as Home
import Pyxis.Pages.NotFound as NotFound
import Pyxis.Router as Router


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
        (case model.currentRoute of
            Router.Homepage ->
                [ Menu.view model
                , viewContent
                    [ Home.view model
                    ]
                ]

            Router.Accordion ->
                [ Menu.view model
                , viewContent
                    [ Html.map AccordionMsg <| Accordion.view model.accordionModel
                    ]
                ]

            Router.NotFound ->
                [ Menu.view model
                , viewContent
                    [ NotFound.view
                    ]
                ]
        )


viewContent : List (Html Msg) -> Html Msg
viewContent =
    div
        [ class "pyxis__content" ]

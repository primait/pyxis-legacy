module View exposing (view)

import Browser exposing (Document)
import Commons.Menu as Menu
import Html exposing (Html, div)
import Html.Attributes exposing (class)
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

            Router.Button ->
                [ Menu.view model
                , viewContent
                    [ Html.map ButtonMsg <| Button.view model.buttonModel
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

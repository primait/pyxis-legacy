module Pages.Accordion exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, br, div, text)
import Pages.Accordion.Model as M exposing (Accordion(..), Model, Msg)
import Pages.Component as ComponentPage
import Prima.Pyxis.Accordion as PyxisAccordion


view : Model -> Html Msg
view ({ translate } as model) =
    div []
        [ ComponentPage.view
            { title = translate [] "accordion-page.title"
            , description = translate [] "accordion-page.description"
            , specsList =
                [ "Border: 1px solid"
                , "Padding: 20px"
                , "Icon: icon-info"
                ]
            , viewComponent = \_ -> exampleAccordion
            , sections =
                [ singleAccordionSection model
                ]
            }
        ]


singleAccordionSection : Model -> ComponentPage.SectionViewModel Msg
singleAccordionSection model =
    { title = "Single Accordion"
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Light
            , example = """TODO"""
            , label = "on light color"
            , onTogglePreview = always M.NoOp
            }
            [ PyxisAccordion.light (M.toSlug Light) M.Toggle
                |> PyxisAccordion.withSimpleTitle title
                |> PyxisAccordion.withContent content
                |> PyxisAccordion.render model.accordionLight
            ]
        , ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Gray
            , example = """TODO"""
            , label = "on dark color"
            , onTogglePreview = always M.NoOp
            }
            [ PyxisAccordion.base (M.toSlug Base) M.Toggle
                |> PyxisAccordion.withSimpleTitle title
                |> PyxisAccordion.withContent content
                |> PyxisAccordion.render model.accordionBase
            ]
        , ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Dark
            , example = """TODO"""
            , label = "on brand gradient"
            , onTogglePreview = always M.NoOp
            }
            [ PyxisAccordion.dark (M.toSlug Dark) M.Toggle
                |> PyxisAccordion.withSimpleTitle title
                |> PyxisAccordion.withContent content
                |> PyxisAccordion.render model.accordionDark
            ]
        ]
    }


title : String
title =
    "Lorem ipsum dolor sit amet."


content : List (Html Msg)
content =
    [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
    , br [] []
    , text "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    ]


exampleAccordion : Html Msg
exampleAccordion =
    PyxisAccordion.light "example" (\_ -> \_ -> M.NoOp)
        |> PyxisAccordion.withSimpleTitle title
        |> PyxisAccordion.withContent content
        |> PyxisAccordion.render PyxisAccordion.close

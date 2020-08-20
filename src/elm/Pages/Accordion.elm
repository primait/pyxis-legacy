module Pages.Accordion exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, br, div, text)
import Html.Attributes exposing (class)
import Pages.Accordion.Model as M exposing (AccordionId(..), Model, Msg)
import Pages.Component as ComponentPage
import Prima.Pyxis.Accordion as PyxisAccordion


view : Model -> Html Msg
view ({ translate } as model) =
    div [ class "accordion-page" ]
        [ ComponentPage.view
            { title = translate [] "accordion-page.title"
            , description = translate [] "accordion-page.description"
            , specs =
                Just
                    { list =
                        [ "Border: 1px solid"
                        , "Padding: 20px"
                        , "Icon: icon-info"
                        ]
                    , viewComponent = exampleAccordion
                    }
            , sections =
                [ singleAccordionSection model
                , accordionGroupSection model
                ]
            }
        ]


singleAccordionSection : Model -> ComponentPage.SectionViewConfig Msg
singleAccordionSection model =
    let
        accordionStateOf : AccordionId -> PyxisAccordion.State
        accordionStateOf id =
            M.getAccordionState (M.idToString id) model
    in
    { title = "Single Accordion"
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { id = "single-light"
            , isCodeVisible = M.isInspecting "single-light" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "on light color"
            , onTogglePreview = M.ToggleInspect
            }
            [ PyxisAccordion.render
                (accordionStateOf M.Light)
                (lightAccordionConfig M.Light)
            ]
        , ComponentViewer.view
            { id = "single-base"
            , isCodeVisible = M.isInspecting "single-base" model
            , boxType = Box.Base
            , example = """TODO"""
            , label = "on base color"
            , onTogglePreview = M.ToggleInspect
            }
            [ PyxisAccordion.render
                (accordionStateOf M.Base)
                (baseAccordionConfig M.Base)
            ]
        , ComponentViewer.view
            { id = "single-dark"
            , isCodeVisible = M.isInspecting "single-dark" model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = "on brand gradient"
            , onTogglePreview = M.ToggleInspect
            }
            [ PyxisAccordion.render
                (accordionStateOf M.Dark)
                (darkAccordionConfig M.Dark)
            ]
        ]
    }


accordionGroupSection : Model -> ComponentPage.SectionViewConfig Msg
accordionGroupSection model =
    let
        accordionStateOf : AccordionId -> PyxisAccordion.State
        accordionStateOf id =
            M.getAccordionState (M.idToString id) model
    in
    { title = "Accordion Group"
    , suggestions =
        Just
            { dontList =
                [ "Non utilizzare mai l’accordion su sfondo con gradiente."
                , "Non modificare l’icona di default."
                , "L’accordion non accetta altri link all’interno del titolo."
                , "Non modificare font-weight e text-transformation del titolo"
                ]
            , doList =
                [ "Utilizzare l’accordion sempre su questi tre sfondi" ]
            }
    , content =
        [ ComponentViewer.view
            { id = "group-light"
            , isCodeVisible = M.isInspecting "group-light" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "on light color"
            , onTogglePreview = M.ToggleInspect
            }
            [ PyxisAccordion.renderGroup
                [ ( accordionStateOf (M.LightGroup 1), lightAccordionConfig (M.LightGroup 1) )
                , ( accordionStateOf (M.LightGroup 2), lightAccordionConfig (M.LightGroup 2) )
                , ( accordionStateOf (M.LightGroup 3), lightAccordionConfig (M.LightGroup 3) )
                ]
            ]
        , ComponentViewer.view
            { id = "group-base"
            , isCodeVisible = M.isInspecting "group-base" model
            , boxType = Box.Base
            , example = """TODO"""
            , label = "on base color"
            , onTogglePreview = M.ToggleInspect
            }
            [ PyxisAccordion.renderGroup
                [ ( accordionStateOf (M.BaseGroup 1), baseAccordionConfig (M.BaseGroup 1) )
                , ( accordionStateOf (M.BaseGroup 2), baseAccordionConfig (M.BaseGroup 2) )
                , ( accordionStateOf (M.BaseGroup 3), baseAccordionConfig (M.BaseGroup 3) )
                ]
            ]
        , ComponentViewer.view
            { id = "group-dark"
            , isCodeVisible = M.isInspecting "group-dark" model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = "on light color"
            , onTogglePreview = M.ToggleInspect
            }
            [ PyxisAccordion.renderGroup
                [ ( accordionStateOf (M.DarkGroup 1), darkAccordionConfig (M.DarkGroup 1) )
                , ( accordionStateOf (M.DarkGroup 2), darkAccordionConfig (M.DarkGroup 2) )
                , ( accordionStateOf (M.DarkGroup 3), darkAccordionConfig (M.DarkGroup 3) )
                ]
            ]
        ]
    }


lightAccordionConfig : AccordionId -> PyxisAccordion.Config Msg
lightAccordionConfig id =
    PyxisAccordion.light (M.idToString id) M.ToggleAccordion
        |> PyxisAccordion.withSimpleTitle title
        |> PyxisAccordion.withContent content


baseAccordionConfig : AccordionId -> PyxisAccordion.Config Msg
baseAccordionConfig id =
    PyxisAccordion.base (M.idToString id) M.ToggleAccordion
        |> PyxisAccordion.withSimpleTitle title
        |> PyxisAccordion.withContent content


darkAccordionConfig : AccordionId -> PyxisAccordion.Config Msg
darkAccordionConfig id =
    PyxisAccordion.dark (M.idToString id) M.ToggleAccordion
        |> PyxisAccordion.withSimpleTitle title
        |> PyxisAccordion.withContent content


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
    PyxisAccordion.light "example" (\_ _ -> M.NoOp)
        |> PyxisAccordion.withSimpleTitle title
        |> PyxisAccordion.withContent content
        |> PyxisAccordion.render PyxisAccordion.close

module Pages.Button exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Pages.Button.Model exposing (Model, Msg(..))
import Pages.Component as ComponentPage
import Prima.Pyxis.Button as PyxisButton


view : Model -> Html Msg
view model =
    div
        [ class "button-page" ]
        [ ComponentPage.view (pageModel model) ]


pageModel : Model -> ComponentPage.ViewModel Msg
pageModel ({ translate } as model) =
    { title = translate [] "buttons-page.title"
    , description = translate [] "buttons-page.description"
    , specsList = [ "Font: uppercase", "Font family: Heavy", "Letter spacing: 1px" ]
    , viewComponent = \_ -> buttonPreview
    , sections = pageSections model
    }


buttonPreview : Html msg
buttonPreview =
    PyxisButton.callOut "Large button" |> PyxisButton.render


pageSections : Model -> List (ComponentPage.SectionViewModel Msg)
pageSections model =
    [ calloutButtonSection
    , primaryButtonSection
    , secondaryButtonSection
    , tertiaryButtonSection
    , buttonGroupSection
    , buttonGroupCoverSection
    ]


calloutButtonSection : ComponentPage.SectionViewModel Msg
calloutButtonSection =
    { title = "Call out button"
    , suggestions =
        Just
            { dontList =
                [ "Dovrebbe esserci solo un pulsante Call out per pagina."
                , "Non utilizzare il pulsante Call out su background on gradient color"
                ]
            , doList =
                [ "Il pulsante call out comunica grande enfasi ed è riservato per incoraggiare azioni molto importanti come la funzione …Procedi.. nel flusso."
                , "Non esiste uno stile tiny per questo pulsante perché è pensato per essere intenzionalmente prominente."
                ]
            }
    , content =
        [ ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Light
            , example = """<button></button>"""
            , label = "on light color"
            , onTogglePreview = ToggleInspectMode
            }
            [ PyxisButton.callOut "Large button" |> PyxisButton.render
            , PyxisButton.callOut "Disable button" |> PyxisButton.withDisabled True |> PyxisButton.render
            , PyxisButton.callOut "small button" |> PyxisButton.withSmallSize |> PyxisButton.render
            , Html.span [] [ text "(/) no tiny size" ]
            ]
        , ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Dark
            , example = """<button></button>"""
            , label = "on dark color"
            , onTogglePreview = ToggleInspectMode
            }
            [ PyxisButton.callOut "Large button" |> PyxisButton.render
            , PyxisButton.callOut "Disable button" |> PyxisButton.withDisabled True |> PyxisButton.render
            , PyxisButton.callOut "small button" |> PyxisButton.withSmallSize |> PyxisButton.render
            , Html.span [] [ text "(/) no tiny size" ]
            ]
        ]
    }


primaryButtonSection : ComponentPage.SectionViewModel Msg
primaryButtonSection =
    buttonsShowcase
        { title = "Primary Button"
        , suggestions =
            Just
                { dontList =
                    [ "Non dovrà essere posizionato in prossimità del pulsante Call out."
                    ]
                , doList =
                    [ "Dovrebbe essere usato al posto di un pulsante cta quando l'azione richiede meno rilievo."
                    , "Può essere utilizzato in prossimità di pulsanti di Secondary e Tertiary."
                    ]
                }
        , normalButton = PyxisButton.primary
        , altButton = PyxisButton.primaryAlt
        }


secondaryButtonSection : ComponentPage.SectionViewModel Msg
secondaryButtonSection =
    buttonsShowcase
        { title = "Secondary Button"
        , suggestions =
            Just
                { dontList =
                    [ "Non dovrà essere posizionato in prossimità del pulsante Call out."
                    ]
                , doList =
                    [ "Il pulsante secondario è per scarsa enfasi."
                    , "Può essere utilizzato in prossimità di altri pulsanti di Primary, Secondary e Tertiary."
                    ]
                }
        , normalButton = PyxisButton.primary
        , altButton = PyxisButton.primaryAlt
        }


tertiaryButtonSection : ComponentPage.SectionViewModel Msg
tertiaryButtonSection =
    buttonsShowcase
        { title = "Tertiary Button"
        , suggestions =
            Just
                { dontList =
                    [ "Non dovrà essere posizionato in prossimità del pulsante Call out."
                    ]
                , doList =
                    [ "Il pulsante secondario è per scarsa enfasi.??"
                    , "Può essere utilizzato in prossimità di altri pulsanti di Primary, Secondary e Tertiary."
                    ]
                }
        , normalButton = PyxisButton.primary
        , altButton = PyxisButton.primaryAlt
        }


buttonGroupCoverSection : ComponentPage.SectionViewModel Msg
buttonGroupCoverSection =
    { title = "Button Group Cover Fluid"
    , suggestions =
        Just
            { dontList =
                [ "Non utilizzare mai l’accordion su sfondo con gradiente."
                ]
            , doList =
                [ "Un bottone all'interno di un gruppo fluido ha una dimensione massima che non dipende dal testo, in caso di shrink oltre la sua dimensione prevista per mantenerlo su una linea il testo potrà scendere su un massimo di due righe e poi verrà tagliato"
                , "I margini automatici sono supportati fino a un massimo di 4 bottoni e funziona correttamente solo all'interno di un a-container o a-containerFluid diretto"
                , "Si può utilizzare questa classe in unione a un container per realizzare bottoni singoli di larghezza arbitraria"
                , "Nel caso di contenitori innestati è necessario sovrascrivere le media query di margine."
                ]
            }
    , content =
        [ ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Light
            , example = """<button></button>"""
            , label = "Cover Fluid"
            , onTogglePreview = ToggleInspectMode
            }
            [ text "TODO"
            ]
        , ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Light
            , example = """<button></button>"""
            , label = "Group Cover Fluid"
            , onTogglePreview = ToggleInspectMode
            }
            [ text "TODO"
            ]
        ]
    }



-- VIEW HELPERS


type alias ButtonShowCase =
    { title : String
    , suggestions : Maybe ComponentPage.Suggestions
    , normalButton : String -> PyxisButton.Config Msg
    , altButton : String -> PyxisButton.Config Msg
    }


buttonsShowcase : ButtonShowCase -> ComponentPage.SectionViewModel Msg
buttonsShowcase { title, suggestions, normalButton, altButton } =
    { title = title
    , suggestions = suggestions
    , content =
        [ ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Light
            , example = """<button></button>"""
            , label = "on light color"
            , onTogglePreview = ToggleInspectMode
            }
            [ "large button" |> normalButton |> PyxisButton.render
            , "disable button" |> normalButton |> PyxisButton.withDisabled True |> PyxisButton.render
            , "small button" |> normalButton |> PyxisButton.withSmallSize |> PyxisButton.render
            , "tiny button" |> normalButton |> PyxisButton.withTinySize |> PyxisButton.render
            ]
        , ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Dark
            , example = """<button></button>"""
            , label = "on dark color"
            , onTogglePreview = ToggleInspectMode
            }
            [ "large button" |> altButton |> PyxisButton.render
            , "disable button" |> altButton |> PyxisButton.withDisabled True |> PyxisButton.render
            , "small button" |> altButton |> PyxisButton.withSmallSize |> PyxisButton.render
            , "tiny button" |> altButton |> PyxisButton.withTinySize |> PyxisButton.render
            ]
        , ComponentViewer.view
            { isCodeVisible = False
            , boxType = Box.Gradient
            , example = """<button></button>"""
            , label = "on brand gradient"
            , onTogglePreview = ToggleInspectMode
            }
            [ "large button" |> altButton |> PyxisButton.render
            , "disable button" |> altButton |> PyxisButton.withDisabled True |> PyxisButton.render
            , "small button" |> altButton |> PyxisButton.withSmallSize |> PyxisButton.render
            , "tiny button" |> altButton |> PyxisButton.withTinySize |> PyxisButton.render
            ]
        ]
    }


buttonGroupSection : ComponentPage.SectionViewModel Msg
buttonGroupSection =
    let
        list =
            [ "button-group"
            , "space-between"
            , "space-evenly"
            , "giustificato al centro"
            , "space-around"
            , "giustificato content-start"
            , "giustificato content-end"
            ]
    in
    { title = "ButtonGroup"
    , suggestions = Nothing
    , content =
        List.map
            (\name ->
                ComponentViewer.view
                    { isCodeVisible = False
                    , boxType = Box.Light
                    , example = """<button></button>"""
                    , label = name
                    , onTogglePreview = ToggleInspectMode
                    }
                    [ text "TODO"
                    ]
            )
            list
    }

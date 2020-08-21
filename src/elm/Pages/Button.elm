module Pages.Button exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Helpers as H
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, classList, style)
import Pages.Button.Model as M exposing (Model, Msg(..))
import Pages.Component as ComponentPage
import Prima.Pyxis.Button as PyxisButton
import Prima.Pyxis.DownloadButton as PyxisDownloadButton


view : Model -> Html Msg
view model =
    div
        [ class "button-page" ]
        [ ComponentPage.view (pageConfig model) ]


pageConfig : Model -> ComponentPage.ViewConfig Msg
pageConfig ({ translate } as config) =
    { title = translate [] "buttons-page.title"
    , description = translate [] "buttons-page.description"
    , specs =
        Just
            { list =
                [ "Font: uppercase"
                , "Font family: Heavy"
                , "Letter spacing: 1px"
                ]
            , viewComponent = buttonPreview
            }
    , sections = pageSections config
    }


buttonPreview : Html msg
buttonPreview =
    PyxisButton.primary "Large button" |> PyxisButton.render


pageSections : Model -> List (ComponentPage.SectionViewConfig Msg)
pageSections model =
    [ calloutButtonSection model
    , primaryButtonSection model
    , secondaryButtonSection model
    , tertiaryButtonSection model
    , downloadButtonSection model
    , buttonGroupSection model
    , buttonGroupCoverFluidSection model
    ]


calloutButtonSection : Model -> ComponentPage.SectionViewConfig Msg
calloutButtonSection model =
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
            { id = "light-callout"
            , isCodeVisible = M.isInspecting "light-callout" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "on light color"
            , onTogglePreview = ToggleInspectMode
            }
            [ PyxisButton.callOut "Large button" |> PyxisButton.render
            , PyxisButton.callOut "Disable button" |> PyxisButton.withDisabled True |> PyxisButton.render
            , PyxisButton.callOut "small button" |> PyxisButton.withSmallSize |> PyxisButton.render
            , Html.span [] [ text "(/) no tiny size" ]
            ]
        , ComponentViewer.view
            { id = "dark-callout"
            , isCodeVisible = M.isInspecting "dark-callout" model
            , boxType = Box.Dark
            , example = """TODO"""
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


primaryButtonSection : Model -> ComponentPage.SectionViewConfig Msg
primaryButtonSection model =
    buttonsShowcase model
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


secondaryButtonSection : Model -> ComponentPage.SectionViewConfig Msg
secondaryButtonSection model =
    buttonsShowcase model
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


tertiaryButtonSection : Model -> ComponentPage.SectionViewConfig Msg
tertiaryButtonSection model =
    buttonsShowcase model
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


downloadButtons : List (Html msg)
downloadButtons =
    [ PyxisDownloadButton.download "Title" "Subtitle"
        |> PyxisDownloadButton.render
    , PyxisDownloadButton.download "Disabled" "Download button"
        |> PyxisDownloadButton.withDisabled True
        |> PyxisDownloadButton.render
    ]


downloadButtonSection : Model -> ComponentPage.SectionViewConfig Msg
downloadButtonSection model =
    { title = "Download Button"
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { id = "light-download"
            , isCodeVisible = M.isInspecting "light-download" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "on light color"
            , onTogglePreview = ToggleInspectMode
            }
            downloadButtons
        , ComponentViewer.view
            { id = "dark-download"
            , isCodeVisible = M.isInspecting "dark-download" model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = "on dark color"
            , onTogglePreview = ToggleInspectMode
            }
            downloadButtons
        , ComponentViewer.view
            { id = "brand-download"
            , isCodeVisible = M.isInspecting "brand-download" model
            , boxType = Box.Gradient
            , example = """TODO"""
            , label = "on brand gradient"
            , onTogglePreview = ToggleInspectMode
            }
            downloadButtons
        ]
    }


buttonGroupSection : Model -> ComponentPage.SectionViewConfig Msg
buttonGroupSection model =
    let
        list =
            [ ( "button-group", "" )
            , ( "space-between", "justify-content-space-around" )
            , ( "space-evenly", "justify-content-space-evenly" )
            , ( "giustificato al centro", "justify-content-center" )
            , ( "space-around", "justify-content-space-around" )
            , ( "giustificato content-start", "justify-content-flex-start" )
            , ( "giustificato content-end", "justify-content-flex-end" )
            ]
    in
    { title = "ButtonGroup"
    , suggestions = Nothing
    , content =
        List.map
            (\( name, cssClass ) ->
                ComponentViewer.view
                    { id = name ++ "-group"
                    , isCodeVisible = M.isInspecting (name ++ "-group") model
                    , boxType = Box.Light
                    , example =
                        """<div class="btn-group {{modifier}}">...</div>"""
                            |> H.strFormat [ ( "modifier", cssClass ) ]
                    , label = name
                    , onTogglePreview = ToggleInspectMode
                    }
                    [ div
                        [ classList [ ( "btn-group", True ), ( cssClass, True ) ]
                        , style "width" "100%"
                        ]
                        [ buttonPreview
                        , buttonPreview
                        , buttonPreview
                        ]
                    ]
            )
            list
    }


buttonGroupCoverFluidSection : Model -> ComponentPage.SectionViewConfig Msg
buttonGroupCoverFluidSection model =
    { title = "Button Group Cover Fluid"
    , suggestions =
        Just
            { dontList =
                [ "Non utilizzare mai l’accordion su sfondo con gradiente."
                ]
            , doList =
                [ """Un bottone all'interno di un gruppo fluido ha una dimensione
                 massima che non dipende dal testo, in caso di shrink oltre la
                 sua dimensione prevista per mantenerlo su una linea il testo
                 potrà scendere su un massimo di due righe e poi verrà tagliato"""
                , """I margini automatici sono supportati fino a un massimo di
                4 bottoni e funziona correttamente solo all'interno di un
                a-container o a-containerFluid diretto"""
                , """Si può utilizzare questa classe in unione a un container
                per realizzare bottoni singoli di larghezza arbitraria"""
                , """Nel caso di contenitori innestati è necessario
                sovrascrivere le media query di margine."""
                ]
            }
    , content =
        [ ComponentViewer.view
            { id = "cover-fluid"
            , isCodeVisible = M.isInspecting "cover-fluid" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "Cover Fluid"
            , onTogglePreview = ToggleInspectMode
            }
            [ div [ class "btn-group btn-group--cover-fluid", style "width" "100%" ] [ buttonPreview ]
            ]
        , ComponentViewer.view
            { id = "group-cover-fluid"
            , isCodeVisible = M.isInspecting "group-cover-fluid" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "Group Cover Fluid"
            , onTogglePreview = ToggleInspectMode
            }
            [ div [ class "btn-group btn-group--cover-fluid", style "width" "100%" ]
                [ buttonPreview, buttonPreview, buttonPreview ]
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


buttonsShowcase : Model -> ButtonShowCase -> ComponentPage.SectionViewConfig Msg
buttonsShowcase model { title, suggestions, normalButton, altButton } =
    { title = title
    , suggestions = suggestions
    , content =
        [ ComponentViewer.view
            { id = title ++ "light"
            , isCodeVisible = M.isInspecting (title ++ "light") model
            , boxType = Box.Light
            , example = """TODO"""
            , label = "on light color"
            , onTogglePreview = ToggleInspectMode
            }
            [ "large button" |> normalButton |> PyxisButton.render
            , "disable button" |> normalButton |> PyxisButton.withDisabled True |> PyxisButton.render
            , "small button" |> normalButton |> PyxisButton.withSmallSize |> PyxisButton.render
            , "tiny button" |> normalButton |> PyxisButton.withTinySize |> PyxisButton.render
            ]
        , ComponentViewer.view
            { id = title ++ "dark"
            , isCodeVisible = M.isInspecting (title ++ "dark") model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = "on dark color"
            , onTogglePreview = ToggleInspectMode
            }
            [ "large button" |> altButton |> PyxisButton.render
            , "disable button" |> altButton |> PyxisButton.withDisabled True |> PyxisButton.render
            , "small button" |> altButton |> PyxisButton.withSmallSize |> PyxisButton.render
            , "tiny button" |> altButton |> PyxisButton.withTinySize |> PyxisButton.render
            ]
        , ComponentViewer.view
            { id = title ++ "brand"
            , isCodeVisible = M.isInspecting (title ++ "brand") model
            , boxType = Box.Gradient
            , example = """TODO"""
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

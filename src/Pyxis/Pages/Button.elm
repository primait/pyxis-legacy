module Pyxis.Pages.Button exposing (Model, Msg, initialModel, update, view)

import Dict exposing (Dict)
import Html exposing (Attribute, Html, article, div, h1, h2, h5, li, p, section, text, ul)
import Html.Attributes exposing (class)
import Prima.Pyxis.Button as Button
import Prima.Pyxis.ButtonGroup as ButtonGroup
import Pyxis.TabbedContainer as TabbedContainer


type Msg
    = ClickLink
    | TabbedContainerUpdate String TabbedContainer.State


type alias Model =
    { tabbedContainerStates : Dict String TabbedContainer.State
    }


initialModel : Model
initialModel =
    { tabbedContainerStates = Dict.empty
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickLink ->
            ( model, Cmd.none )

        TabbedContainerUpdate slug newTabbedContainerState ->
            ( { model
                | tabbedContainerStates = Dict.insert slug newTabbedContainerState model.tabbedContainerStates
              }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    article []
        (List.concat
            [ [ sectionIntro ]
            , [ Button.callOut "CallOut" ]
                |> ButtonGroup.create
                |> ButtonGroup.withAlignmentCentered
                |> ButtonGroup.render
                |> List.singleton
            , List.map
                (renderSampleSection model)
                [ sectionCallout
                , sectionPrimary
                , sectionSecondary
                , sectionTertiary
                ]
            ]
        )


sectionIntro : Html Msg
sectionIntro =
    section [ class "pyxis__page-button__section-intro" ]
        [ h1 []
            [ text "Component" ]
        , p []
            [ text "Aggiungere la classe a-btn con i suoi vari modificatori per ottenere un bottone di dimensioni standard. Un bottone standard di default si dispone automaticamente al centro orizzontale del suo elenento padre. Le varianti dark sono visibili correttamente solo su un background scuro. Quando è necessario impilare più bottoni in uno stesso contenuto è opportuno utilizzare la classe m-btnGroup e le sue varianti."
            ]
        , div [ class "pyxis__page-button__section-intro__button-primer" ]
            [ inset InsetLight
                [ class "pyxis__page-button__section-intro__button-primer__sample" ]
                [ [ Button.callOut "BUTTON" ]
                    |> ButtonGroup.create
                    |> ButtonGroup.withAlignmentCentered
                    |> ButtonGroup.render
                ]
            , div [ class "pyxis__page-button__section-intro__button-primer__specs" ]
                [ h5 []
                    [ text "SPECIFICHE TECNICHE" ]
                , ul []
                    [ li [] [ text "Font uppercase" ]
                    , li [] [ text "Font family: Heavy" ]
                    , li [] [ text "Letter spacing: 1px" ]
                    ]
                ]
            ]
        ]


type alias SampleSection =
    { sectionClass : String
    , headerText : String
    , insetVariants : List InsetVariant
    , buttonVariant : ButtonVariant
    , dos : List String
    , donts : List String
    }


sectionCallout : SampleSection
sectionCallout =
    { sectionClass = "pyxis__page-button__section-callout"
    , headerText = "Call Out Button"
    , insetVariants = [ InsetLight, InsetDark ]
    , buttonVariant = Callout
    , dos =
        [ "Il pulsante call out comunica grande enfasi ed è riservato per incoraggiare azioni molto importanti come la funzione Procedi nel flusso."
        , "Non esiste uno stile tiny per questo pulsante perché è pensato per essere intenzionalmente prominente."
        ]
    , donts =
        [ "Dovrebbe esserci solo un pulsante Call out per pagina."
        , "Non utilizzare il pulsante Call out su background on gradient color"
        ]
    }


sectionPrimary : SampleSection
sectionPrimary =
    { sectionClass = "pyxis__page-button__section-primary"
    , headerText = "Primary Button"
    , insetVariants = [ InsetLight, InsetDark, InsetBrand ]
    , buttonVariant = Primary
    , dos =
        [ "Non dovrà essere posizionato in prossimità del pulsante Call out."
        ]
    , donts =
        [ "Dovrebbe essere usato al posto di un pulsante cta quando l'azione richiede meno rilievo."
        , "Può essere utilizzato in prossimità di pulsanti di Secondary e Tertiary."
        ]
    }


sectionSecondary : SampleSection
sectionSecondary =
    { sectionClass = "pyxis__page-button__section-secondary"
    , headerText = "Secondary Button"
    , insetVariants = [ InsetLight, InsetDark, InsetBrand ]
    , buttonVariant = Secondary
    , dos =
        [ "Non dovrà essere posizionato in prossimità del pulsante Call out."
        ]
    , donts =
        [ "Il pulsante secondario è per scarsa enfasi."
        , "Può essere utilizzato in prossimità di altri pulsanti di Primary, Secondary e Tertiary."
        ]
    }


sectionTertiary : SampleSection
sectionTertiary =
    { sectionClass = "pyxis__page-button__section-tertiary"
    , headerText = "Tertiary Button"
    , insetVariants = [ InsetLight, InsetDark, InsetBrand ]
    , buttonVariant = Tertiary
    , dos =
        [ "Non dovrà essere posizionato in prossimità del pulsante Call out."
        ]
    , donts =
        [ "Il pulsante secondario è per scarsa enfasi.??????"
        , "Può essere utilizzato in prossimità di altri pulsanti di Primary, Secondary e Tertiary."
        ]
    }


renderSampleSection : Model -> SampleSection -> Html Msg
renderSampleSection model sampleSection =
    section [ class sampleSection.sectionClass ]
        (List.concat
            [ [ h2 [] [ text sampleSection.headerText ] ]
            , List.map (renderSampleTabbedContainer model sampleSection.buttonVariant) sampleSection.insetVariants
            , [ dosAndDonts { dos = sampleSection.dos, donts = sampleSection.donts } ]
            ]
        )


renderSampleTabbedContainer : Model -> ButtonVariant -> InsetVariant -> Html Msg
renderSampleTabbedContainer model buttonVariant insetVariant =
    let
        slug =
            getSlug buttonVariant insetVariant

        buttonCreator =
            buttonVariantToCreator buttonVariant
    in
    TabbedContainer.view
        (TabbedContainerUpdate slug)
        (Dict.get slug model.tabbedContainerStates |> Maybe.withDefault TabbedContainer.init)
        [ { label = "PREVIEW"
          , content =
                inset insetVariant
                    []
                    [ div [ class "pyxis__page-button__preview-container" ]
                        [ div []
                            [ div [ class "fw-heavy" ] [ text "COMPONENT" ]
                            , div [] [ text "on light color" ]
                            ]
                        , [ buttonCreator "LARGE BUTTON"
                          , buttonCreator "DISABLED BUTTON" |> Button.withDisabled True
                          , buttonCreator "SMALL BUTTON" |> Button.withSmallSize
                          ]
                            |> ButtonGroup.create
                            |> ButtonGroup.withAlignmentSpaceBetween
                            |> ButtonGroup.render
                        ]
                    ]
          }
        , { label = "</> CODE", content = inset InsetLight [] [] }
        ]


getSlug : ButtonVariant -> InsetVariant -> String
getSlug buttonVariant insetVariant =
    buttonVariantToSlug buttonVariant ++ "_" ++ insetVariantToSlug insetVariant


buttonVariantToSlug : ButtonVariant -> String
buttonVariantToSlug buttonVariant =
    case buttonVariant of
        Callout ->
            "callout"

        Primary ->
            "primary"

        Secondary ->
            "secondary"

        Tertiary ->
            "tertiary"


buttonVariantToCreator : ButtonVariant -> String -> Button.Config Msg
buttonVariantToCreator buttonVariant =
    case buttonVariant of
        Callout ->
            Button.callOut

        Primary ->
            Button.primary

        Secondary ->
            Button.secondary

        Tertiary ->
            Button.tertiary


insetVariantToSlug : InsetVariant -> String
insetVariantToSlug insetVariant =
    case insetVariant of
        InsetLight ->
            "light"

        InsetDark ->
            "dark"

        InsetBrand ->
            "brand"


sectionButtonGroup : Model -> Html Msg
sectionButtonGroup model =
    section [ class "pyxis__page-button__section-button-group" ]
        [ h1 [] [ text "Button Group" ] ]


sectionButtonGroupCoverFluid : Model -> Html Msg
sectionButtonGroupCoverFluid model =
    section [ class "pyxis__page-button__section-button-group-cover-fluid" ]
        [ h1 [] [ text "Button Group Cover Fluid" ] ]


type ButtonVariant
    = Callout
    | Primary
    | Secondary
    | Tertiary


type InsetVariant
    = InsetLight
    | InsetDark
    | InsetBrand


inset :
    InsetVariant
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
inset insetVariant attributes contents =
    let
        insetDivClass =
            case insetVariant of
                InsetLight ->
                    "pyxis__page-button__inset-light"

                InsetDark ->
                    "pyxis__page-button__inset-dark"

                InsetBrand ->
                    "pyxis__page-button__inset-brand"
    in
    div (class insetDivClass :: attributes) contents


dosAndDonts : { dos : List String, donts : List String } -> Html msg
dosAndDonts dosAndDonts_ =
    div [ class "dos-and-donts" ]
        [ div [ class "dos-and-donts__donts" ]
            [ div [ class "dos-and-donts__donts__header" ]
                [ text "DON'T" ]
            , ul [ class "dos-and-donts__donts__list" ]
                (List.map (text >> List.singleton >> li []) dosAndDonts_.dos)
            ]
        , div [ class "dos-and-donts__dos" ]
            [ div [ class "dos-and-donts__dos__header" ]
                [ text "DO" ]
            , ul [ class "dos-and-donts__dos__list" ]
                (List.map (text >> List.singleton >> li []) dosAndDonts_.donts)
            ]
        ]

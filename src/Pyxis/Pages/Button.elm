module Pyxis.Pages.Button exposing (Model, Msg, initialModel, update, view)

import Html exposing (Attribute, Html, article, button, div, h1, h5, li, p, section, text, ul)
import Html.Attributes exposing (class)
import Pyxis.TabbedContainer as TabbedContainer


type Msg
    = ClickLink
    | TabbedContainerUpdate TabbedContainer.State
    | TabbedContainerUpdateCallout1 TabbedContainer.State
    | TabbedContainerUpdateCallout2 TabbedContainer.State


type alias Model =
    { tabbedContainerState : TabbedContainer.State
    , tabbedContainerStateCallout1 : TabbedContainer.State
    , tabbedContainerStateCallout2 : TabbedContainer.State
    }


initialModel : Model
initialModel =
    { tabbedContainerState = TabbedContainer.init
    , tabbedContainerStateCallout1 = TabbedContainer.init
    , tabbedContainerStateCallout2 = TabbedContainer.init
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickLink ->
            ( model, Cmd.none )

        TabbedContainerUpdate newTabbedContainerState ->
            ( { model | tabbedContainerState = newTabbedContainerState }, Cmd.none )

        TabbedContainerUpdateCallout1 newState ->
            ( { model | tabbedContainerStateCallout1 = newState }, Cmd.none )

        TabbedContainerUpdateCallout2 newState ->
            ( { model | tabbedContainerStateCallout2 = newState }, Cmd.none )


view : Model -> Html Msg
view model =
    article []
        [ sectionIntro
        , sectionCallout model
        , sectionPrimary model
        , sectionSecondary model
        , sectionTertiary model
        , sectionButtonGroup model
        , sectionButtonGroupCoverFluid model
        ]


sectionIntro : Html Msg
sectionIntro =
    section [ class "pyxis__page-button__section-intro" ]
        [ h1 []
            [ text "Component" ]
        , p []
            [ text "Aggiungere la classe a-btn con i suoi vari modificatori per ottenere un bottone di dimensioni standard. Un bottone standard di default si dispone automaticamente al centro orizzontale del suo elenento padre. Le varianti dark sono visibili correttamente solo su un background scuro. Quando è necessario impilare più bottoni in uno stesso contenuto è opportuno utilizzare la classe m-btnGroup e le sue varianti."
            ]
        , div []
            [ insetLight []
                [ button [ class "btn btn--primary" ] [ text "BUTTON" ] ]
            , div []
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


sectionCallout : Model -> Html Msg
sectionCallout model =
    section [ class "pyxis__page-button__section-callout" ]
        [ h1 []
            [ text "Call Out Button" ]
        , TabbedContainer.view
            TabbedContainerUpdateCallout1
            model.tabbedContainerStateCallout1
            [ { label = "PREVIEW"
              , content =
                    insetLight []
                        [ div [ class "pyxis__page-button__preview-container" ]
                            [ div []
                                [ div [ class "fw-heavy" ] [ text "COMPONENT" ]
                                , div [] [ text "on light color" ]
                                ]
                            , button [ class "btn btn--callout" ] [ text "LARGE BUTTON" ]
                            , button [ class "btn btn--callout is-disabled" ] [ text "DISABLED BUTTON" ]
                            , button [ class "btn btn--callout btn--small" ] [ text "SMALL BUTTON" ]
                            ]
                        ]
              }
            , { label = "</> CODE", content = text "" }
            ]
        , TabbedContainer.view
            TabbedContainerUpdateCallout2
            model.tabbedContainerStateCallout2
            [ { label = "PREVIEW"
              , content =
                    insetDark []
                        [ div [ class "pyxis__page-button__preview-container" ]
                            [ div []
                                [ div [ class "fw-heavy" ] [ text "COMPONENT" ]
                                , div [] [ text "on dark color" ]
                                ]
                            , button [ class "btn btn--callout" ] [ text "LARGE BUTTON" ]
                            , button [ class "btn btn--callout is-disabled" ] [ text "DISABLED BUTTON" ]
                            , button [ class "btn btn--callout btn--small" ] [ text "SMALL BUTTON" ]
                            ]
                        ]
              }
            , { label = "</> CODE", content = text "" }
            ]
        , dosAndDonts
            { dos =
                [ "Il pulsante call out comunica grande enfasi ed è riservato per incoraggiare azioni molto importanti come la funzione Procedi nel flusso."
                , "Non esiste uno stile tiny per questo pulsante perché è pensato per essere intenzionalmente prominente."
                ]
            , donts =
                [ "Dovrebbe esserci solo un pulsante Call out per pagina."
                , "Non utilizzare il pulsante Call out su background on gradient color"
                ]
            }
        ]


sectionPrimary : Model -> Html Msg
sectionPrimary model =
    section [ class "pyxis__page-button__section-primary" ]
        [ h1 [] [ text "Primary Button" ] ]


sectionSecondary : Model -> Html Msg
sectionSecondary model =
    section [ class "pyxis__page-button__section-secondary" ]
        [ h1 [] [ text "Secondary Button" ] ]


sectionTertiary : Model -> Html Msg
sectionTertiary model =
    section [ class "pyxis__page-button__section-tertiary" ]
        [ h1 [] [ text "Tertiary Button" ] ]


sectionButtonGroup : Model -> Html Msg
sectionButtonGroup model =
    section [ class "pyxis__page-button__section-button-group" ]
        [ h1 [] [ text "Button Group" ] ]


sectionButtonGroupCoverFluid : Model -> Html Msg
sectionButtonGroupCoverFluid model =
    section [ class "pyxis__page-button__section-button-group-cover-fluid" ]
        [ h1 [] [ text "Button Group Cover Fluid" ] ]


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
    case insetVariant of
        InsetLight ->
            div (class "pyxis__page-button__inset-light" :: attributes) contents

        InsetDark ->
            div (class "pyxis__page-button__inset-dark" :: attributes) contents

        InsetBrand ->
            div (class "pyxis__page-button__inset-brand" :: attributes) contents


insetLight :
    List (Attribute msg)
    -> List (Html msg)
    -> Html msg
insetLight =
    inset InsetLight


insetDark :
    List (Attribute msg)
    -> List (Html msg)
    -> Html msg
insetDark =
    inset InsetDark


insetBrand :
    List (Attribute msg)
    -> List (Html msg)
    -> Html msg
insetBrand =
    inset InsetBrand


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

module Pages.Home exposing (view)

import Html exposing (Html, a, dd, div, dl, dt, h1, img, p, section, text)
import Html.Attributes as Attr exposing (alt, class, src, style)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
import Prima.Pyxis.Button as PyxisButton
import Route exposing (Route)


view : Model -> Html Msg
view ({ t } as model) =
    div
        [ class "home-page" ]
        [ section []
            [ div [ class "box box--jumbotron" ]
                [ div [ class "box__content" ]
                    [ div [ class "mq-mobile-hidden" ] [ img [ src "public/logo-pyxis.png", style "filter" "grayscale(1)", style "width" "150px" ] [] ]
                    , p [] [ text <| t "home.pyxis-description" [] ]
                    ]
                ]
            ]
        , section []
            [ h1 [] [ text "Progetta, sviluppa, racconta" ]
            , p [] [ text "Con Pyxis hai tutto quello che ti serve per semplificare il tuo lavoro" ]
            ]
        , section [ class "flex-container" ]
            [ viewNavBox
                { icon = "1"
                , title = "Design"
                , description = """Esplora documentazione e reference per progettare al meglio."""
                , linkText = "Esplora"
                , linkTo = Nothing
                }
            , viewNavBox
                { icon = "2"
                , title = "Sviluppo"
                , description = """Ricerca componenti e soluzioni per lavorare in completa autonomia."""
                , linkText = "Ricerca"
                , linkTo = Nothing
                }
            , viewNavBox
                { icon = "1"
                , title = "Brand"
                , description = """Scopri materiali e guideline per raccontare il nostro brand."""
                , linkText = "Scopri"
                , linkTo = Nothing
                }
            ]
        , section [ class "flex-container" ]
            [ div []
                [ h1 [] [ text "Più veloce, più sicuro, più coerente" ]
                , p []
                    [ text """
                        Un design system non è una zavorra di vincoli e
                        condizioni: è un bagaglio di strumenti e informazioni che ci
                        permette di osare di più senza perdere di vista l’obiettivo."""
                    ]
                , dl []
                    [ dt [] [ text "Modelli, esempi, riferimenti" ]
                    , dd [] [ text "Permette di creare documentazione utile in ogni situazione." ]
                    , dt [] [ text "Tempo ed energia" ]
                    , dd [] [ text "Velocizza il lavoro e aiuta a concentrarsi sugli aspetti importanti." ]
                    , dt [] [ text "Cultura collettiva" ]
                    , dd [] [ text "Genera e diffonde conoscenza, per tutti e a tutti i livelli." ]
                    ]
                ]
            , div []
                [ img [ alt "placeholder image" ] [] ]
            ]
        , section [ class "flex-container flex-container--reversed" ]
            [ div []
                [ h1 [] [ text "Quello che facciamo, lo facciamo insieme" ]
                , p []
                    [ text """
                        Pyxis è l’unica fonte di risorse e documentazione per
                        tutti i processi di design, sviluppo front-end e
                        creazione di contenuti. Somiglia a noi e al nostro modo
                        di pensare:"""
                    ]
                , dl []
                    [ dt [] [ text "Semplice" ]
                    , dd [] [ text "È uno strumento efficace ed essenziale, chiaro e alla portata di tutti." ]
                    , dt [] [ text "Scalabile" ]
                    , dd [] [ text "È composto da soluzioni adattabili a ogni esigenza di business." ]
                    , dt [] [ text "Originale" ]
                    , dd [] [ text "È innovativo per il suo settore e non teme di anticipare la concorrenza." ]
                    ]
                ]
            , div []
                [ img [ alt "placeholder image 2" ] [] ]
            ]
        , section []
            [ div [ class "box box--jumbotron" ]
                [ div [ class "box__content" ]
                    [ h1 [] [ text """Design e necessità di business sono
                        conseguenza uno dell’altra, perché la coerenza tra
                        loro è parte di una precisa strategia.""" ]
                    , p []
                        [ text """L’immagine che diamo di noi ha
                                bisogno di cura e attenzione, perché il modo in
                                cui ci mostriamo è parte del nostro brand e della nostra identità."""
                        ]
                    ]
                ]
            ]
        ]


viewNavBox :
    { icon : String
    , title : String
    , description : String
    , linkText : String
    , linkTo : Maybe Route
    }
    -> Html Msg
viewNavBox { icon, title, description, linkText, linkTo } =
    div
        [ class "nav-box", onClick (ChangeRoute linkTo) ]
        [ div [ class "nav-box__header" ]
            [ div [ class "nav-box__icon" ]
                [ img [ src icon, alt icon ] [] ]
            ]
        , div [ Attr.class "nav-box__content" ]
            [ h1 [ class "nav-box__title" ] [ text title ]
            , p [ class "nav-box__description" ] [ text description ]
            ]
        , div [ Attr.class "nav-box__footer" ]
            [ viewLinkButton
                { label = linkText
                , linkTo = linkTo
                }
            ]
        ]


viewLinkButton : { label : String, linkTo : Maybe Route } -> Html msg
viewLinkButton { label, linkTo } =
    let
        btn =
            PyxisButton.callOut label
                |> PyxisButton.withClass "mq-mobile-hidden"
                |> PyxisButton.withTinySize
                |> PyxisButton.render

        arrow =
            div [ class "nav-box__arrow" ] []
    in
    case linkTo of
        Nothing ->
            div [] [ btn, arrow ]

        Just route ->
            a [ Route.href route ]
                [ btn
                , arrow
                ]

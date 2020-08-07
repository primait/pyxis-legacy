module Pages.Home exposing (view)

import Html exposing (Html, a, div, h1, img, p, section, text)
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
                    [ div [] [ img [ src "public/logo-pyxis.png", style "filter" "grayscale(1)", style "width" "150px" ] [] ]
                    , p [] [ text <| t "home.pyxis-description" [] ]
                    ]
                ]
            ]
        , section []
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

module Pages.Home exposing (view)

import Html exposing (Html, a, div, h1, h2, h6, img, li, p, section, text, ul)
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
            [ div [ class "main-box" ]
                [ div [ class "main-box__content" ]
                    [ div [ class "mq-mobile-hidden" ] [ img [ src "public/logo-pyxis.png", style "filter" "grayscale(1)", style "width" "150px" ] [] ]
                    , p [] [ text <| t [] "home.section-0.content" ]
                    ]
                , img [ class "main-box__image", src "public/pyxis-1.png" ] []
                ]
            ]
        , section []
            [ h2 [ class "c-text-dark" ] [ text <| t [] "home.section-1.title" ]
            , p [] [ text <| t [] "home.section-1.content" ]
            ]
        , section [ class "flex-container" ]
            [ viewNavBox
                { icon = "1"
                , title = t [] "home.section-2.boxes.0.title"
                , description = t [] "home.section-2.boxes.0.content"
                , linkText = t [] "home.section-2.boxes.0.button"
                , linkTo = Nothing
                }
            , viewNavBox
                { icon = "2"
                , title = t [] "home.section-2.boxes.1.title"
                , description = t [] "home.section-2.boxes.1.content"
                , linkText = t [] "home.section-2.boxes.1.button"
                , linkTo = Nothing
                }
            , viewNavBox
                { icon = "3"
                , title = t [] "home.section-2.boxes.2.title"
                , description = t [] "home.section-2.boxes.2.content"
                , linkText = t [] "home.section-2.boxes.2.button"
                , linkTo = Nothing
                }
            ]
        , section [ class "flex-container" ]
            [ div []
                [ h2 [ class "c-text-dark" ] [ text <| t [] "home.section-3.title" ]
                , p []
                    [ text <| t [] "home.section-3.content"
                    ]
                , ul []
                    [ li []
                        [ h6 [ class "c-text-dark" ] [ text <| t [] "home.section-3.list.1.title" ]
                        , p [] [ text <| t [] "home.section-3.list.0.content" ]
                        ]
                    , li []
                        [ h6 [ class "c-text-dark" ] [ text <| t [] "home.section-3.list.2.title" ]
                        , p [] [ text <| t [] "home.section-3.list.1.content" ]
                        ]
                    , li []
                        [ h6 [ class "c-text-dark" ] [ text <| t [] "home.section-3.list.3.title" ]
                        , p [] [ text <| t [] "home.section-3.list.2.content" ]
                        ]
                    ]
                ]
            , div [ class "u-pos-center" ]
                [ img [ src "REPLACE ME", alt "placeholder image" ] [] ]
            ]
        , section [ class "flex-container flex-container--reversed" ]
            [ div []
                [ h2 [ class "c-text-dark" ] [ text <| t [] "home.section-4.title" ]
                , p []
                    [ text <| t [] "home.section-4.content"
                    ]
                , ul []
                    [ li []
                        [ h6 [ class "c-text-dark" ] [ text <| t [] "home.section-4.list.0.title" ]
                        , p [] [ text <| t [] "home.section-4.list.0.content" ]
                        ]
                    , li []
                        [ h6 [ class "c-text-dark" ] [ text <| t [] "home.section-4.list.1.title" ]
                        , p [] [ text <| t [] "home.section-4.list.1.content" ]
                        ]
                    , li []
                        [ h6 [ class "c-text-dark" ] [ text <| t [] "home.section-4.list.2.title" ]
                        , p [] [ text <| t [] "home.section-4.list.2.content" ]
                        ]
                    ]
                ]
            , div [ class "u-pos-center" ]
                [ img [ src "REPLACE ME", alt "placeholder image 2" ] [] ]
            ]
        , section []
            [ div [ class "footer-box" ]
                [ div [ class "footer-box__content" ]
                    [ div [ class "footer-box__title" ] [ text <| t [] "home.section-5.title" ]
                    , p []
                        [ text <| t [] "home.section-5.content"
                        ]
                    ]
                , img [ class "footer-box__image", src "public/prima-it-home.png", alt "" ] []
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

module Pages.Home exposing (view)

import Html exposing (Html, a, div, h1, h2, h6, img, li, p, section, span, text, ul)
import Html.Attributes as Attr exposing (alt, class, classList, src, style)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
import Prima.Pyxis.Button as PyxisButton
import Route exposing (Route)


view : Model -> Html Msg
view ({ translate } as model) =
    div
        [ class "home-page" ]
        [ viewHeader model
        , section [ class "section" ]
            [ h2 [ class "heading c-text-dark" ] [ text <| translate [] "home.intro.title" ]
            , p [ class "paragraph" ] [ text <| translate [] "home.intro.content" ]
            ]
        , viewNavBoxesSection model
        , viewSectionWithImage
            { reversed = False
            , titleText = translate [] "home.section-1.title"
            , titleImage = "public/images/home/illustration-1-mobile.svg"
            , paragraph = translate [] "home.section-1.content"
            , image = "public/images/home/illustration-1.svg"
            , items =
                [ { title = translate [] "home.section-1.list.0.title"
                  , content = translate [] "home.section-1.list.0.content"
                  }
                , { title = translate [] "home.section-1.list.1.title"
                  , content = translate [] "home.section-1.list.1.content"
                  }
                , { title = translate [] "home.section-1.list.2.title"
                  , content = translate [] "home.section-1.list.2.content"
                  }
                ]
            }
        , viewSectionWithImage
            { reversed = True
            , titleText = translate [] "home.section-2.title"
            , titleImage = "public/images/home/illustration-2-mobile.svg"
            , paragraph = translate [] "home.section-2.content"
            , image = "public/images/home/illustration-2.svg"
            , items =
                [ { title = translate [] "home.section-2.list.0.title"
                  , content = translate [] "home.section-2.list.0.content"
                  }
                , { title = translate [] "home.section-2.list.1.title"
                  , content = translate [] "home.section-2.list.1.content"
                  }
                , { title = translate [] "home.section-2.list.2.title"
                  , content = translate [] "home.section-2.list.2.content"
                  }
                ]
            }
        , viewFooter model
        ]


viewHeader : Model -> Html Msg
viewHeader { translate } =
    section [ class "section" ]
        [ div [ class "main-box" ]
            [ div [ class "main-box__content" ]
                [ div [ class "mq-mobile-hidden" ]
                    [ img
                        [ src "public/images/home/logo-pyxis-grey.svg", style "width" "150px" ]
                        []
                    ]
                , p [] [ text <| translate [] "home.header.content" ]
                ]
            , img [ class "main-box__image", src "public/images/home/isometric-logo.svg" ] []
            ]
        ]


viewNavBoxesSection : Model -> Html Msg
viewNavBoxesSection { translate } =
    section [ class "section flex-container" ]
        [ viewNavBox
            { icon = "public/images/home/icon-brush.svg"
            , title = translate [] "home.nav-boxes.0.title"
            , description = translate [] "home.nav-boxes.0.content"
            , linkText = translate [] "home.nav-boxes.0.button"
            , linkTo = Nothing
            }
        , viewNavBox
            { icon = "public/images/home/icon-development.svg"
            , title = translate [] "home.nav-boxes.1.title"
            , description = translate [] "home.nav-boxes.1.content"
            , linkText = translate [] "home.nav-boxes.1.button"
            , linkTo = Nothing
            }
        , viewNavBox
            { icon = "public/images/home/icon-player.svg"
            , title = translate [] "home.nav-boxes.2.title"
            , description = translate [] "home.nav-boxes.2.content"
            , linkText = translate [] "home.nav-boxes.2.button"
            , linkTo = Nothing
            }
        ]


type alias SectionWithImageConfig =
    { reversed : Bool
    , titleText : String
    , titleImage : String
    , paragraph : String
    , image : String
    , items :
        List
            { title : String
            , content : String
            }
    }


viewSectionWithImage : SectionWithImageConfig -> Html Msg
viewSectionWithImage config =
    section
        [ class "section flex-container"
        , classList [ ( "flex-container--reversed", config.reversed ) ]
        ]
        [ div []
            [ div [ class "heading-container" ]
                [ img [ class "heading-container__img", src config.titleImage ] []
                , h2 [ class "heading-container__text" ] [ text config.titleText ]
                ]
            , p []
                [ text config.paragraph ]
            , ul [] (List.map viewListItem config.items)
            ]
        , div [ class "u-pos-center mq-mobile-hidden" ]
            [ img [ src config.image ] [] ]
        ]


viewListItem : { title : String, content : String } -> Html Msg
viewListItem { title, content } =
    div []
        [ h6 [ class "c-text-dark" ] [ text title ]
        , p [] [ text <| content ]
        ]


viewFooter : Model -> Html Msg
viewFooter ({ translate } as model) =
    section [ class "section" ]
        [ div [ class "footer-box" ]
            [ div [ class "footer-box__content" ]
                [ div [ class "footer-box__title" ] [ text <| translate [] "home.footer.title" ]
                , p []
                    [ text <| translate [] "home.footer.content"
                    ]
                ]
            , img [ class "footer-box__image", src "public/images/home/home-prima-mockup.png", alt "" ] []
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

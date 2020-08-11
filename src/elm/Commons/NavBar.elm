module Commons.NavBar exposing (view)

import Array
import Html exposing (Html, a, button, div, header, img, li, nav, span, text, ul)
import Html.Attributes exposing (alt, class, classList, src)
import Html.Events exposing (onClick)
import Model exposing (DropdownMenu, MenuLink, Model, Msg(..))
import Route exposing (Route(..), href)


view : Model -> Html Msg
view model =
    nav [ class "navbar" ]
        [ header [ class "navbar__header" ]
            [ button
                [ class "navbar__button"
                , onClick (ToggleMenu (not model.isMenuOpen))
                ]
                [ viewHamburgerIcon model.isMenuOpen ]
            , div
                [ class "navbar__logo-container" ]
                [ img
                    [ class "navbar__logo-image"
                    , src "public/images/home/logo-pyxis-color.svg"
                    , alt "Logo"
                    ]
                    []
                ]
            , span
                [ class "badge badge--primary navbar__logo-version " ]
                [ text "3.0" ]
            ]
        , div [ class "navbar__content" ]
            [ div []
                (model.menuList
                    |> Array.toIndexedList
                    |> List.map
                        (\( index, menu ) ->
                            viewDropdownMenu ( index, menu ) model
                        )
                )
            ]
        ]


viewHamburgerIcon : Bool -> Html msg
viewHamburgerIcon active =
    div
        [ class "hamburger-icon"
        , classList [ ( "hamburger-icon--active", active ) ]
        ]
        [ div [ class "hamburger-icon__line" ] [] ]


viewDropdownMenu : ( Int, DropdownMenu ) -> Model -> Html Msg
viewDropdownMenu ( id, menu ) model =
    div
        [ class "dropdown-menu"
        , classList
            [ ( "dropdown-menu--open", menu.isOpen )
            ]
        ]
        [ viewDropdownToggler ( id, menu ) model
        , ul [ class "dropdown-menu__list" ] <|
            List.map
                (\item ->
                    li
                        [ class "dropdown-menu__list-item"
                        ]
                        [ viewMenuLink item model ]
                )
                menu.items
        ]


viewDropdownToggler : ( Int, DropdownMenu ) -> Model -> Html Msg
viewDropdownToggler ( id, menu ) model =
    div
        [ class "dropdown-menu__toggler"
        , onClick (ToggleDropDown id (not menu.isOpen))
        ]
        [ div [ class "dropdown-menu__toggler-label" ] [ viewMenuLink menu.link model ]
        , button
            [ class "dropdown-menu__open-indicator"
            , classList [ ( "visually-hidden", List.isEmpty menu.items ) ]
            ]
            [ text "+" ]
        ]


viewMenuLink : MenuLink -> Model -> Html Msg
viewMenuLink link { t, currentRoute } =
    div [ class "dropdown-menu__link-wrapper" ]
        [ case link.route of
            Just route ->
                a
                    [ class "dropdown-menu__link"
                    , classList [ ( "dropdown-menu__link--active", route == currentRoute ) ]
                    , Route.href route
                    ]
                    [ text <| t [] link.label ]

            Nothing ->
                span [ class "dropdown-menu__link" ]
                    [ text <| t [] link.label ]
        ]

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
                    , src "public/logo-pyxis.png"
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
                            viewDropdownMenu ( index, menu ) model.currentRoute
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


viewDropdownMenu : ( Int, DropdownMenu ) -> Route -> Html Msg
viewDropdownMenu ( id, menu ) currentRoute =
    div
        [ class "dropdown-menu"
        , classList
            [ ( "dropdown-menu--open", menu.isOpen )
            ]
        ]
        [ viewDropdownToggler ( id, menu ) currentRoute
        , ul [ class "dropdown-menu__list" ] <|
            List.map
                (\item ->
                    li
                        [ class "dropdown-menu__list-item"
                        ]
                        [ viewMenuLink item currentRoute ]
                )
                menu.items
        ]


viewDropdownToggler : ( Int, DropdownMenu ) -> Route -> Html Msg
viewDropdownToggler ( id, menu ) currentRoute =
    div
        [ class "dropdown-menu__toggler"
        , onClick (ToggleDropDown id (not menu.isOpen))
        ]
        [ div [ class "dropdown-menu__toggler-label" ] [ viewMenuLink menu.link currentRoute ]
        , button
            [ class "dropdown-menu__open-indicator"
            , classList [ ( "visually-hidden", List.isEmpty menu.items ) ]
            ]
            [ text "+" ]
        ]


viewMenuLink : MenuLink -> Route -> Html Msg
viewMenuLink link currentRoute =
    div [ class "dropdown-menu__link-wrapper" ]
        [ case link.route of
            Just route ->
                a
                    [ class "dropdown-menu__link"
                    , classList [ ( "dropdown-menu__link--active", route == currentRoute ) ]
                    , Route.href route
                    ]
                    [ text link.label ]

            Nothing ->
                span [ class "dropdown-menu__link" ]
                    [ text link.label ]
        ]

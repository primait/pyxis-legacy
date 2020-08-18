module Commons.NavBar exposing (NavBarItem(..), ViewConfig, view)

import Html exposing (Html, a, button, div, header, img, li, nav, span, text, ul)
import Html.Attributes exposing (alt, class, classList, src)
import Html.Events exposing (onClick)
import Route exposing (Route, href)


type NavBarItem
    = DropdownMenu DropdownMenuConfig
    | MenuLink MenuLinkConfig


type alias DropdownMenuConfig =
    { id : String
    , label : String
    , isOpen : Bool
    , items : List NavBarItem
    }


type alias MenuLinkConfig =
    { label : String
    , route : Maybe Route
    }


type alias ViewConfig msg =
    { isOpen : Bool
    , currentRoute : Route
    , menuList : List NavBarItem
    , onToggleMenu : Bool -> msg
    , onToggleDropdown : String -> Bool -> msg
    }



-- VIEW


view : ViewConfig msg -> Html msg
view config =
    nav [ class "navbar" ]
        [ header [ class "navbar__header" ]
            [ button
                [ class "navbar__button"
                , onClick (config.onToggleMenu (not config.isOpen))
                ]
                [ viewHamburgerIcon config.isOpen ]
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
                (config.menuList
                    |> List.map (\item -> viewNavbarItem item config)
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


viewNavbarItem : NavBarItem -> ViewConfig msg -> Html msg
viewNavbarItem item viewConfig =
    case item of
        DropdownMenu config ->
            viewDropdownMenu config viewConfig

        MenuLink config ->
            viewMenuLink config viewConfig


viewDropdownMenu : DropdownMenuConfig -> ViewConfig msg -> Html msg
viewDropdownMenu menu config =
    div
        [ class "dropdown-menu"
        , classList
            [ ( "dropdown-menu--open", menu.isOpen )
            ]
        ]
        [ viewDropdownToggler menu config
        , ul [ class "dropdown-menu__list" ] <|
            List.map
                (\item ->
                    li
                        [ class "dropdown-menu__list-item"
                        ]
                        [ viewNavbarItem item config ]
                )
                menu.items
        ]


viewDropdownToggler : DropdownMenuConfig -> ViewConfig msg -> Html msg
viewDropdownToggler menu config =
    div
        [ class "dropdown-menu__toggler"
        , onClick (config.onToggleDropdown menu.id (not menu.isOpen))
        ]
        [ div [ class "dropdown-menu__toggler-label" ]
            [ span [] [ text menu.label ] ]
        , button
            [ class "dropdown-menu__open-indicator"
            , classList [ ( "visually-hidden", List.isEmpty menu.items ) ]
            ]
            [ text "+" ]
        ]


viewMenuLink : MenuLinkConfig -> ViewConfig msg -> Html msg
viewMenuLink link { currentRoute } =
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

module Commons.NavBar exposing (view)

import Dict
import Html exposing (Html, a, button, div, header, img, li, nav, span, text, ul)
import Html.Attributes exposing (alt, class, classList, src)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
import Route exposing (Route(..), href)


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


type alias ViewModel =
    List NavBarItem


navbarMenuItems : Model -> ViewModel
navbarMenuItems { translate, navbarMenuState } =
    let
        isMenuOpen id =
            Maybe.withDefault False (Dict.get id navbarMenuState)
    in
    [ MenuLink { label = translate [] "navbar.welcome", route = Just Route.Homepage }
    , MenuLink { label = translate [] "navbar.start", route = Nothing }
    , DropdownMenu
        { id = "style-menu"
        , label = translate [] "navbar.style.title"
        , isOpen = isMenuOpen "style-menu"
        , items =
            [ MenuLink { label = translate [] "navbar.style.sub-menu.0", route = Nothing }
            , MenuLink { label = translate [] "navbar.style.sub-menu.1", route = Nothing }
            , MenuLink { label = translate [] "navbar.style.sub-menu.2", route = Nothing }
            , MenuLink { label = translate [] "navbar.style.sub-menu.3", route = Nothing }
            , MenuLink { label = translate [] "navbar.style.sub-menu.4", route = Nothing }
            ]
        }
    , DropdownMenu
        { id = "content-menu"
        , label = translate [] "navbar.content.title"
        , isOpen = isMenuOpen "content-menu"
        , items =
            [ MenuLink { label = translate [] "navbar.content.sub-menu.0", route = Nothing }
            , MenuLink { label = translate [] "navbar.content.sub-menu.1", route = Nothing }
            ]
        }
    , DropdownMenu
        { id = "patterns-menu"
        , label = translate [] "navbar.patterns.title"
        , isOpen = isMenuOpen "patterns-menu"
        , items =
            [ MenuLink { label = translate [] "navbar.patterns.sub-menu.0", route = Nothing }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.1", route = Nothing }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.2", route = Nothing }
            ]
        }
    , DropdownMenu
        { id = "components-menu"
        , label = translate [] "navbar.components.title"
        , isOpen = isMenuOpen "components-menu"
        , items =
            [ DropdownMenu
                { id = "actions-menu"
                , label = "Actions"
                , isOpen = isMenuOpen "actions-menu"
                , items =
                    [ MenuLink { label = translate [] "navbar.components.accordion", route = Just Route.Accordion }
                    , MenuLink { label = translate [] "navbar.components.button", route = Just Route.Button }
                    , MenuLink { label = "...", route = Nothing }
                    ]
                }
            , DropdownMenu
                { id = ""
                , label = "Input"
                , isOpen = isMenuOpen ""
                , items = [ MenuLink { label = "...", route = Nothing } ]
                }
            ]
        }
    , DropdownMenu
        { id = "tools-menu"
        , label = translate [] "navbar.tools.title"
        , isOpen = isMenuOpen "tools-menu"
        , items =
            [ MenuLink { label = translate [] "navbar.tools.sub-menu.0", route = Nothing }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.1", route = Nothing }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.2", route = Nothing }
            ]
        }
    ]


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
                (navbarMenuItems model
                    |> List.map
                        (\menu ->
                            viewNavbarItem menu model
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


viewNavbarItem : NavBarItem -> Model -> Html Msg
viewNavbarItem item model =
    case item of
        DropdownMenu config ->
            viewDropdownMenu config model

        MenuLink config ->
            viewMenuLink config model


viewDropdownMenu : DropdownMenuConfig -> Model -> Html Msg
viewDropdownMenu menu model =
    div
        [ class "dropdown-menu"
        , classList
            [ ( "dropdown-menu--open", menu.isOpen )
            ]
        ]
        [ viewDropdownToggler menu model
        , ul [ class "dropdown-menu__list" ] <|
            List.map
                (\item ->
                    li
                        [ class "dropdown-menu__list-item"
                        ]
                        [ viewNavbarItem item model ]
                )
                menu.items
        ]


viewDropdownToggler : DropdownMenuConfig -> Model -> Html Msg
viewDropdownToggler menu _ =
    div
        [ class "dropdown-menu__toggler"
        , onClick (ToggleDropDown menu.id (not menu.isOpen))
        ]
        [ div [ class "dropdown-menu__toggler-label" ]
            [ span [] [ text menu.label ] ]
        , button
            [ class "dropdown-menu__open-indicator"
            , classList [ ( "visually-hidden", List.isEmpty menu.items ) ]
            ]
            [ text "+" ]
        ]


viewMenuLink : MenuLinkConfig -> Model -> Html Msg
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

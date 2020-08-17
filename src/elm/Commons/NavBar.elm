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
                { id = "components-actions-menu"
                , label = "Actions"
                , isOpen = isMenuOpen "components-actions-menu"
                , items =
                    [ MenuLink { label = translate [] "navbar.components.button", route = Just (Route.Component Route.Button) }
                    , MenuLink { label = "Link", route = Just (Route.Component Route.Link) }
                    ]
                }
            , DropdownMenu
                { id = "components-input"
                , label = "Input"
                , isOpen = isMenuOpen "components-input"
                , items =
                    [ MenuLink { label = "Dropdown / Select", route = Just (Route.Component Route.Select) }
                    , MenuLink { label = "Checkbox", route = Just (Route.Component Route.Checkbox) }
                    , MenuLink { label = "Radio Button", route = Just (Route.Component Route.RadioButton) }
                    , MenuLink { label = "Text field & Text area", route = Just (Route.Component Route.TextField) }
                    , MenuLink { label = "Date field", route = Just (Route.Component Route.DateField) }
                    , MenuLink { label = "Pill button", route = Just (Route.Component Route.PillButton) }
                    , MenuLink { label = "Autocomplete", route = Just (Route.Component Route.Autocomplete) }
                    ]
                }
            , DropdownMenu
                { id = "components-feedback"
                , label = "Feedback"
                , isOpen = isMenuOpen "components-feedback"
                , items =
                    [ MenuLink { label = "Messages", route = Just (Route.Component Route.Message) }
                    , MenuLink { label = "Tooltip", route = Just (Route.Component Route.Tooltip) }
                    , MenuLink { label = "Loader", route = Just (Route.Component Route.Loader) }
                    ]
                }
            , DropdownMenu
                { id = "components-navigation"
                , label = "Navigation"
                , isOpen = isMenuOpen "components-navigation"
                , items =
                    [ MenuLink { label = "Tab", route = Just (Route.Component Route.Tab) }
                    , MenuLink { label = "Dropdown menu", route = Just (Route.Component Route.DropdownMenu) }
                    , MenuLink { label = "Navigation elements", route = Just (Route.Component Route.NavigationElements) }
                    ]
                }
            , DropdownMenu
                { id = "components-status"
                , label = "Status"
                , isOpen = isMenuOpen "components-status"
                , items = [ MenuLink { label = "Badges", route = Just (Route.Component Route.Badge) } ]
                }
            , DropdownMenu
                { id = "components-other"
                , label = "Altro"
                , isOpen = isMenuOpen "components-other"
                , items =
                    [ MenuLink { label = "Jumbotrons", route = Just (Route.Component Route.Jumbotron) }
                    , MenuLink { label = "Accordions", route = Just (Route.Component Route.Accordion) }
                    ]
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



-- VIEW


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

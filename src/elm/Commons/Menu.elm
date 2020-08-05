module Commons.Menu exposing (view)

import Html exposing (Html, a, button, div, h1, header, img, li, nav, span, text, ul)
import Html.Attributes exposing (alt, class, classList, src)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
import Route exposing (Route(..), href)


type Menu
    = MenuItem MenuItemConfig
    | DropDown DropDownConfig


type alias MenuItemConfig =
    { label : String
    , route : Route
    }


type alias DropDownConfig =
    { label : String
    , isOpen : Bool
    , items : List MenuItemConfig
    }


menuItems : List Menu
menuItems =
    [ MenuItem { label = "Welcome", route = Route.Homepage }
    , MenuItem { label = "Start using pyxis", route = Route.NotFound }
    , DropDown
        { label = "Style"
        , isOpen = True
        , items = []
        }
    , DropDown
        { label = "Content"
        , isOpen = True
        , items = []
        }
    , DropDown
        { label = "Patterns"
        , isOpen = True
        , items = []
        }
    , DropDown
        { label = "Components"
        , isOpen = True
        , items =
            [ { label = "Accordion", route = Route.Accordion }
            , { label = "Button", route = Route.Button }
            ]
        }
    , DropDown
        { label = "Tools and resources"
        , isOpen = True
        , items = []
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
                [ text "Menu" ]
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
                [ class "navbar__logo-version" ]
                [ text "3.0" ]
            ]
        , div [ class "navbar__content" ] <|
            List.map viewMenu menuItems
        ]


viewMenu : Menu -> Html Msg
viewMenu menu =
    case menu of
        MenuItem config ->
            viewMenuItem config

        DropDown config ->
            viewDropDownMenu config


viewMenuItem : MenuItemConfig -> Html Msg
viewMenuItem config =
    div [ class "menu-item" ]
        [ a
            [ class "menu-item__link"
            , Route.href config.route
            ]
            [ text config.label ]
        ]


viewDropDownMenu : DropDownConfig -> Html Msg
viewDropDownMenu menu =
    div
        [ class "dropdown-menu"
        , classList [ ( "dropdown-menu--open", menu.isOpen ) ]
        ]
        [ div
            [ class "dropdown-menu__toggler" ]
            [ span
                [ class "dropdown-menu__label" ]
                [ text menu.label ]
            , span
                [ class "dropdown-menu__open-indicator" ]
                [ text "+" ]
            ]
        , ul [ class "dropdown-menu__list" ] <|
            List.map
                (\item ->
                    li [ class "dropdown-menu__list-item" ] [ viewMenuItem item ]
                )
                menu.items
        ]

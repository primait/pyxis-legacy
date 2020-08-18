module View exposing (view)

import Browser exposing (Document)
import Commons.NavBar as NavBar exposing (NavBarItem(..))
import Html exposing (Html, div, footer, img, span, text)
import Html.Attributes exposing (class, classList, src)
import Model exposing (Model, Msg(..))
import Pages.Accordion as AccordionPage
import Pages.Button as ButtonPage
import Pages.Component as ComponentPage
import Pages.Home as Home
import Pages.Loader as LoaderPage
import Pages.NotFound as NotFound
import Route


view : Model -> Document Msg
view model =
    { title = "Pyxis"
    , body =
        [ viewBody model
        ]
    }


viewBody : Model -> Html Msg
viewBody model =
    div
        [ class "pyxis" ]
        [ div
            [ class "pyxis__navbar", classList [ ( "pyxis__navbar--open", model.isMenuOpen ) ] ]
            [ NavBar.view (navbarConfig model) ]
        , div
            [ class "pyxis__content" ]
            [ div
                [ class "pyxis-page" ]
                [ div
                    [ class "pyxis-page__content" ]
                    [ viewRouter model ]
                , footer [ class "pyxis-page__footer" ]
                    [ viewBrandLogo ]
                ]
            ]
        ]


viewBrandLogo : Html Msg
viewBrandLogo =
    div
        [ class "brand-logo" ]
        [ img
            [ class "brand-logo__image"
            , src "public/logo-prima.svg"
            ]
            []
        , span
            [ class "brand-logo__label" ]
            [ text "© Prima Assicurazioni S.p.A." ]
        ]


viewRouter : Model -> Html Msg
viewRouter model =
    case model.currentRoute of
        Route.Homepage ->
            Home.view model

        Route.Component Route.Accordion ->
            Html.map AccordionPageMsg <| AccordionPage.view model.accordionModel

        Route.Component Route.Button ->
            Html.map ButtonPageMsg <| ButtonPage.view model.buttonModel

        Route.Component Route.Loader ->
            Html.map LoaderPageMsg <| LoaderPage.view model.loaderModel

        Route.Component _ ->
            div []
                [ ComponentPage.view
                    { title = "Component"
                    , description = "Page under construction"
                    , specsList = [ "..." ]
                    , viewComponent = \_ -> text "<Preview>"
                    , sections = []
                    }
                ]

        Route.NotFound ->
            NotFound.view



-- NAVBAR CONFIG


navbarConfig : Model -> NavBar.ViewConfig Msg
navbarConfig ({ translate } as config) =
    { isOpen = config.isMenuOpen
    , currentRoute = config.currentRoute
    , onToggleMenu = Model.ToggleMenu
    , onToggleDropdown = Model.ToggleDropDown
    , menuList =
        [ MenuLink { label = translate [] "navbar.welcome", route = Just Route.Homepage }
        , MenuLink { label = translate [] "navbar.start", route = Nothing }
        , styleDropdownMenu "style-menu" config
        , contentDropdownMenu "content-menu" config
        , patternsDropdownMenu "patterns-menu" config
        , componentsDropdownMenu "components-menu" config
        , toolsDropdownMenu "tools-menu" config
        ]
    }


styleDropdownMenu : String -> Model -> NavBarItem
styleDropdownMenu id ({ translate } as model) =
    DropdownMenu
        { id = id
        , label = translate [] "navbar.style.title"
        , isOpen = Model.isDropdownOpen id model
        , items =
            [ MenuLink { label = translate [] "navbar.style.sub-menu.0", route = Nothing }
            , MenuLink { label = translate [] "navbar.style.sub-menu.1", route = Nothing }
            , MenuLink { label = translate [] "navbar.style.sub-menu.2", route = Nothing }
            , MenuLink { label = translate [] "navbar.style.sub-menu.3", route = Nothing }
            , MenuLink { label = translate [] "navbar.style.sub-menu.4", route = Nothing }
            ]
        }


contentDropdownMenu : String -> Model -> NavBarItem
contentDropdownMenu id ({ translate } as model) =
    DropdownMenu
        { id = id
        , label = translate [] "navbar.content.title"
        , isOpen = Model.isDropdownOpen id model
        , items =
            [ MenuLink { label = translate [] "navbar.content.sub-menu.0", route = Nothing }
            , MenuLink { label = translate [] "navbar.content.sub-menu.1", route = Nothing }
            ]
        }


patternsDropdownMenu : String -> Model -> NavBarItem
patternsDropdownMenu id ({ translate } as model) =
    DropdownMenu
        { id = id
        , label = translate [] "navbar.patterns.title"
        , isOpen = Model.isDropdownOpen id model
        , items =
            [ MenuLink { label = translate [] "navbar.patterns.sub-menu.0", route = Nothing }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.1", route = Nothing }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.2", route = Nothing }
            ]
        }


componentsDropdownMenu : String -> Model -> NavBarItem
componentsDropdownMenu id ({ translate } as model) =
    DropdownMenu
        { id = id
        , label = translate [] "navbar.components.title"
        , isOpen = Model.isDropdownOpen id model
        , items =
            [ MenuLink { label = "Accordion", route = Just (Route.Component Route.Accordion) }
            , MenuLink { label = "AtrTable", route = Just (Route.Component Route.AtrTable) }
            , MenuLink { label = "Button", route = Just (Route.Component Route.Button) }
            , MenuLink { label = "Container", route = Just (Route.Component Route.Container) }
            , MenuLink { label = "Form", route = Just (Route.Component Route.Form) }
            , MenuLink { label = "Link", route = Just (Route.Component Route.Link) }
            , MenuLink { label = "List-Chooser", route = Just (Route.Component Route.ListChooser) }
            , MenuLink { label = "Loader", route = Just (Route.Component Route.Loader) }
            , MenuLink { label = "Message", route = Just (Route.Component Route.Message) }
            , MenuLink { label = "Modal", route = Just (Route.Component Route.Modal) }
            , MenuLink { label = "Table", route = Just (Route.Component Route.Table) }
            , MenuLink { label = "Tooltip", route = Just (Route.Component Route.Tooltip) }
            ]
        }


toolsDropdownMenu : String -> Model -> NavBarItem
toolsDropdownMenu id ({ translate } as model) =
    DropdownMenu
        { id = id
        , label = translate [] "navbar.tools.title"
        , isOpen = Model.isDropdownOpen id model
        , items =
            [ MenuLink { label = translate [] "navbar.tools.sub-menu.0", route = Nothing }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.1", route = Nothing }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.2", route = Nothing }
            ]
        }

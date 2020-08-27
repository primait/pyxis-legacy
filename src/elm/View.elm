module View exposing (view)

import Browser exposing (Document)
import Commons.NavBar as NavBar exposing (NavBarItem(..))
import Html exposing (Html, div, footer, img, span, text)
import Html.Attributes exposing (class, classList, src)
import Model exposing (Model, Msg(..))
import Pages.Accordion
import Pages.AtrTable
import Pages.Badge
import Pages.BorderRadius
import Pages.Button
import Pages.Color
import Pages.Container
import Pages.ElevationAndShadows
import Pages.Fonts
import Pages.Form
import Pages.GrammarAndMechanics
import Pages.Home
import Pages.Iconography
import Pages.Icons
import Pages.Illustration
import Pages.Link
import Pages.ListChooser
import Pages.Loader
import Pages.Logo
import Pages.Message
import Pages.Modal
import Pages.NotFound
import Pages.StartUsing
import Pages.Table
import Pages.Tooltip
import Pages.Typography
import Pages.UIKit
import Pages.VoiceAndTone
import Prima.Pyxis.Helpers as PyxisHelpers
import Route


view : Model -> Document Msg
view model =
    { title = "Pyxis"
    , body =
        [ PyxisHelpers.pyxisIconSetStyle
        , viewBody model
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
            Pages.Home.view model

        Route.StartUsing ->
            Pages.StartUsing.view model

        -- Style
        Route.Logo ->
            Pages.Logo.view model

        Route.Typography ->
            Pages.Typography.view model

        Route.Color ->
            Pages.Color.view model

        Route.Illustration ->
            Pages.Illustration.view model

        Route.Iconography ->
            Pages.Iconography.view model

        -- Content
        Route.VoiceAndTone ->
            Pages.VoiceAndTone.view model

        Route.GrammarAndMechanics ->
            Pages.GrammarAndMechanics.view model

        -- Patterns
        Route.ElevationAndShadows ->
            Pages.ElevationAndShadows.view model

        Route.BorderRadius ->
            Pages.BorderRadius.view model

        Route.Container ->
            Html.map ContainerPageMsg <| Pages.Container.view model.containerModel

        -- Components
        Route.Component subroute ->
            viewComponentRouter subroute model

        -- Tools and Resources
        Route.UIKit ->
            Pages.UIKit.view model

        Route.Fonts ->
            Pages.Fonts.view model

        Route.Icons ->
            Pages.Icons.view model

        -- Others
        Route.NotFound ->
            Pages.NotFound.view


viewComponentRouter : Route.ComponentRoute -> Model -> Html Msg
viewComponentRouter route model =
    case route of
        Route.Accordion ->
            Html.map AccordionPageMsg <| Pages.Accordion.view model.accordionModel

        Route.AtrTable ->
            Html.map AtrTablePageMsg <| Pages.AtrTable.view model.atrTableModel

        Route.Badge ->
            Html.map BadgePageMsg <| Pages.Badge.view model.badgeModel

        Route.Button ->
            Html.map ButtonPageMsg <| Pages.Button.view model.buttonModel

        Route.Form ->
            Html.map FormPageMsg <| Pages.Form.view model.formModel

        Route.Link ->
            Html.map LinkPageMsg <| Pages.Link.view model.linkModel

        Route.ListChooser ->
            Html.map ListChooserPageMsg <| Pages.ListChooser.view model.listChooserModel

        Route.Loader ->
            Html.map LoaderPageMsg <| Pages.Loader.view model.loaderModel

        Route.Message ->
            Html.map MessagePageMsg <| Pages.Message.view model.messageModel

        Route.Modal ->
            Html.map ModalPageMsg <| Pages.Modal.view model.modalModel

        Route.Table ->
            Html.map TablePageMsg <| Pages.Table.view model.tableModel

        Route.Tooltip ->
            Html.map TooltipPageMsg <| Pages.Tooltip.view model.tooltipModel



-- NAVBAR CONFIG


navbarConfig : Model -> NavBar.ViewConfig Msg
navbarConfig ({ translate } as config) =
    { isOpen = config.isMenuOpen
    , currentRoute = config.currentRoute
    , onToggleMenu = Model.ToggleMenu
    , onToggleDropdown = Model.ToggleDropDown
    , menuList =
        [ MenuLink { label = translate [] "navbar.welcome", route = Just Route.Homepage }
        , MenuLink { label = translate [] "navbar.start", route = Just Route.StartUsing }
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
            [ MenuLink { label = translate [] "navbar.style.sub-menu.logo", route = Just Route.Logo }
            , MenuLink { label = translate [] "navbar.style.sub-menu.typography", route = Just Route.Typography }
            , MenuLink { label = translate [] "navbar.style.sub-menu.color", route = Just Route.Color }
            , MenuLink { label = translate [] "navbar.style.sub-menu.illustration", route = Just Route.Illustration }
            , MenuLink { label = translate [] "navbar.style.sub-menu.iconography", route = Just Route.Iconography }
            ]
        }


contentDropdownMenu : String -> Model -> NavBarItem
contentDropdownMenu id ({ translate } as model) =
    DropdownMenu
        { id = id
        , label = translate [] "navbar.content.title"
        , isOpen = Model.isDropdownOpen id model
        , items =
            [ MenuLink { label = translate [] "navbar.content.sub-menu.voice-and-tone", route = Just Route.VoiceAndTone }
            , MenuLink { label = translate [] "navbar.content.sub-menu.grammar-and-mechanics", route = Just Route.GrammarAndMechanics }
            ]
        }


patternsDropdownMenu : String -> Model -> NavBarItem
patternsDropdownMenu id ({ translate } as model) =
    DropdownMenu
        { id = id
        , label = translate [] "navbar.patterns.title"
        , isOpen = Model.isDropdownOpen id model
        , items =
            [ MenuLink { label = translate [] "navbar.patterns.sub-menu.elevation-and-shadows", route = Just Route.ElevationAndShadows }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.border-radius", route = Just Route.BorderRadius }
            , MenuLink { label = translate [] "navbar.patterns.sub-menu.containers", route = Just Route.Container }
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
            , MenuLink { label = "Badge", route = Just (Route.Component Route.Badge) }
            , MenuLink { label = "Button", route = Just (Route.Component Route.Button) }
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
            [ MenuLink { label = translate [] "navbar.tools.sub-menu.ui-kit", route = Just Route.UIKit }
            , MenuLink { label = translate [] "navbar.tools.sub-menu.fonts", route = Just Route.Fonts }
            , MenuLink { label = translate [] "navbar.tools.sub-menu.icons", route = Just Route.Icons }
            ]
        }

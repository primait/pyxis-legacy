module Pyxis.Pages.Button exposing (view)

import Html exposing (Html, br, div, h1, text)
import Prima.Pyxis.Button as PyxisButton
import Pyxis.Pages.Button.Model exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Buttons" ]
        , PyxisButton.primary "Primary"
        , PyxisButton.secondary "Secondary"
        , PyxisButton.tertiary "Tertiary"
        , PyxisButton.loading "Loading"
        , PyxisButton.primaryAlt "Primary Alt."
        , PyxisButton.secondaryAlt "Secondary Alt."
        , PyxisButton.tertiaryAlt "Tertiary Alt."
        ]

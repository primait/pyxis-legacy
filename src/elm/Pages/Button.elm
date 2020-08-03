module Pages.Button exposing (view)

import Html exposing (Html, div, h1, text)
import Pages.Button.Model exposing (Model, Msg)
import Prima.Pyxis.Button as PyxisButton


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Buttons" ]
        , PyxisButton.render <| PyxisButton.primary "Primary"
        , PyxisButton.render <| PyxisButton.secondary "Secondary"
        , PyxisButton.render <| PyxisButton.tertiary "Tertiary"
        , PyxisButton.render <| PyxisButton.loading "Loading"
        , PyxisButton.render <| PyxisButton.primaryAlt "Primary Alt."
        , PyxisButton.render <| PyxisButton.secondaryAlt "Secondary Alt."
        , PyxisButton.render <| PyxisButton.tertiaryAlt "Tertiary Alt."
        ]

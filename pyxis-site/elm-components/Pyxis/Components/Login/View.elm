module Pyxis.Components.Login.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Prima.Form as Form
    exposing
        ( FormField
        , Validation(..)
        )
import Pyxis.Components.Login.Config exposing (..)
import Pyxis.Components.Login.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.ViewHelpers
    exposing
        ( componentShowdown
        , componentTitle
        , divider
        , inspectableHtml
        )


view : Model -> List (Html Msg)
view model =
    let
        icon position name =
            div
                [ class ("m-form__field__group__" ++ position)
                ]
                [ i [ class ("a-icon a-icon-" ++ name ++ " opacity-5") ] []
                ]
    in
    [ componentTitle [ text "Login" ]
    , divider
    , componentShowdown "Box Login"
        "login"
        InspectHtml
        [ div [ class "o-login a-container a-container--xsmall" ]
            [ h3 [ class "o-login__title" ] [ text "Accedi alla tua area riservata" ]
            , Form.wrapper <| Form.renderWithGroup [ icon "prepend" "mail" ] model <| emailFieldConfig
            , Form.wrapper <| Form.renderWithGroup [ icon "prepend" "lock" ] model <| passwordFieldConfig
            , button [ class "a-btn a-btn--primary" ] [ text "Accedi" ]
            , a [ href "#", class "o-login__link fs-small cBrandAltDark" ] [ text "Password dimenticata?" ]
            ]
        ]
    ]

module Pages.Badge exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div)
import Html.Attributes exposing (class, classList)
import Pages.Badge.Model exposing (BadgeType(..), Model, Msg(..), badgeToCssClass)
import Pages.Component as ComponentPage


view : Model -> Html Msg
view model =
    div [ class "link-page" ]
        [ ComponentPage.view
            { title = "Badge"
            , description = ""
            , specs = Nothing
            , sections =
                [ mainSection model
                ]
            }
        ]


mainSection : Model -> ComponentPage.SectionViewConfig Msg
mainSection model =
    { title = "Badges"
    , suggestions = Nothing
    , content =
        [ ComponentViewer.view
            { id = "light"
            , isCodeVisible = ComponentPage.isInspecting "light" model
            , boxType = Box.Light
            , example = """TODO"""
            , label = ComponentViewer.boxTypeToLabel Box.Light
            , onTogglePreview = ToggleInspect
            }
            normalBadges
        , ComponentViewer.view
            { id = "dark"
            , isCodeVisible = ComponentPage.isInspecting "dark" model
            , boxType = Box.Dark
            , example = """TODO"""
            , label = ComponentViewer.boxTypeToLabel Box.Dark
            , onTogglePreview = ToggleInspect
            }
            altBadges
        , ComponentViewer.view
            { id = "gradient"
            , isCodeVisible = ComponentPage.isInspecting "gradient" model
            , boxType = Box.Gradient
            , example = """TODO"""
            , label = ComponentViewer.boxTypeToLabel Box.Gradient
            , onTogglePreview = ToggleInspect
            }
            altBadges
        ]
    }


normalBadges : List (Html msg)
normalBadges =
    [ viewBadge Primary "Primary"
    , viewBadge Info "Info"
    , viewBadge Success "Success"
    , viewBadge Warning "Warning"
    , viewBadge Danger "Danger"
    ]


altBadges : List (Html msg)
altBadges =
    [ viewBadge PrimaryAlt "Primary"
    , viewBadge InfoAlt "Info"
    , viewBadge SuccessAlt "Success"
    , viewBadge WarningAlt "Warning"
    , viewBadge DangerAlt "Danger"
    ]


viewBadge : BadgeType -> String -> Html msg
viewBadge type_ text =
    Html.span
        [ classList
            [ ( "badge", True )
            , ( badgeToCssClass type_, True )
            ]
        ]
        [ Html.text text ]

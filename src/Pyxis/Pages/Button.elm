module Pyxis.Pages.Button exposing (Model, Msg, initialModel, update, view)

import Html exposing (Attribute, Html, article, button, div, section, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Pyxis.Tabbed as Tabbed


type Msg
    = ClickLink
    | TabbedOnClick String


type alias Model =
    { tabs : List Tab
    , current : String
    }


type alias Tab =
    { slug : String
    , label : String
    }


initialModel : Model
initialModel =
    { tabs = [], current = "prova" }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TabbedOnClick slug ->
            ( { model | current = slug }, Cmd.none )

        ClickLink ->
            ( model, Cmd.none )


tabbedConfig : String -> Tabbed.Tabbed Msg
tabbedConfig current =
    Tabbed.init
        current
        TabbedOnClick
        [ Tabbed.initTab "prova" "prova" (inset InsetLight [] [ button [ onClick ClickLink ] [ text "prova" ] ])
        , Tabbed.initTab "asd" "asd" (button [ onClick ClickLink ] [ text "asd" ])
        ]


view : Model -> Html Msg
view model =
    article []
        [ Tabbed.view (tabbedConfig model.current)
        , sectionIntro
        , sectionCallout
        , sectionPrimary
        , sectionSecondary
        , sectionTertiary
        , sectionButtonGroup
        , sectionButtonGroupCoverFluid
        ]


sectionIntro : Html Msg
sectionIntro =
    section []
        []


sectionCallout : Html Msg
sectionCallout =
    section [] []


sectionPrimary : Html Msg
sectionPrimary =
    section [] []


sectionSecondary : Html Msg
sectionSecondary =
    section [] []


sectionTertiary : Html Msg
sectionTertiary =
    section [] []


sectionButtonGroup : Html Msg
sectionButtonGroup =
    section [] []


sectionButtonGroupCoverFluid : Html Msg
sectionButtonGroupCoverFluid =
    section [] []


type InsetVariant
    = InsetLight
    | InsetDark
    | InsetBrand


inset :
    InsetVariant
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
inset insetVariant attributes contents =
    case insetVariant of
        InsetLight ->
            div (class "inset-light" :: attributes) contents

        InsetDark ->
            div (class "inset-dark" :: attributes) contents

        InsetBrand ->
            div (class "inset-brand" :: attributes) contents

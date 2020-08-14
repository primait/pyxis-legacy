module Pages.Button exposing (view)

import Commons.Box as Box
import Components.ComponentViewer as ComponentViewer
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Pages.Button.Model exposing (Model, Msg(..))
import Pages.Component as ComponentPage


view : Model -> Html Msg
view model =
    div
        [ class "button-page" ]
        [ ComponentPage.view (pageModel model) ]


pageModel : Model -> ComponentPage.ViewModel Msg
pageModel ({ translate } as model) =
    { title = translate [] "buttons-page.title"
    , description = translate [] "buttons-page.description"
    , specsList = [ "Spec 1", "Spec 2", "Spec 3" ]
    , viewComponent = \_ -> Html.button [] [ text "Button" ]
    , sections = pageSections model
    }


pageSections : Model -> List (ComponentPage.SectionViewModel Msg)
pageSections model =
    [ { title = "Primary Button"
      , dontList = [ "dont do 1", "dont do 2", "dont do 3" ]
      , doList = [ "do 1", "do 2", "do 3" ]
      , content =
            [ ComponentViewer.view
                { isCodeVisible = model.isInspecting
                , boxType = Box.Light
                , example = """<button></button>"""
                , onTogglePreview = ToggleInspectMode
                }
                [ Html.button [] [ text "1" ]
                , Html.button [] [ text "2" ]
                , Html.button [] [ text "3" ]
                ]
            ]
      }
    ]

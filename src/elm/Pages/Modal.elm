module Pages.Modal exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.Component as ComponentPage
import Pages.Modal.Model exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    div [ class "modal-page" ]
        [ ComponentPage.view
            { title = "Modal"
            , description = "Page under construction"
            , specs = Nothing
            , sections = []
            }
        ]

module Pages.AtrTable exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Pages.AtrTable.Model exposing (Model, Msg(..))
import Pages.Component as ComponentPage
import Prima.Pyxis.AtrTable as AtrTable



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "atr-table-page" ]
        [ ComponentPage.view
            { title = "Atr-Table"
            , description = ""
            , specs = Nothing
            , sections = []
            }
        , Html.map UpdateAtrTable <| AtrTable.render model.atrTable
        ]

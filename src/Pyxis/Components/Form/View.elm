module Pyxis.Components.Form.View exposing (view)

import Html exposing (..)
import Prima.Form as Form
import Pyxis.Components.Form.Config exposing (..)
import Pyxis.Components.Form.Model
    exposing
        ( Model
        , Msg(..)
        )
import Pyxis.Helpers
    exposing
        ( divider
        , renderOrNothing
        )


view : Model -> List (Html Msg)
view ({ datepicker } as model) =
    [ h2 [] [ text "Form components" ]
    , divider
    , Form.render model textFieldConfig
    , (renderOrNothing << Maybe.map (Form.render model << datepickerFieldConfig)) datepicker
    , Form.render model (autocompleteFieldConfig model)
    , Form.render model radioFieldConfig
    , Form.render model (selectFieldConfig model.isSelectFieldOpen)
    , Form.render model checkboxFieldConfig
    ]

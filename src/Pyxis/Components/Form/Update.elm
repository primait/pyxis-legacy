module Pyxis.Components.Form.Update exposing (update)

import DatePicker exposing (DatePicker)
import Pyxis.Components.Form.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        )
import Pyxis.Helpers
    exposing
        ( datepickerSettings
        , withCmds
        , withoutCmds
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateText Text value ->
            { model | textField = value } |> withoutCmds

        UpdateText Autocomplete value ->
            { model | autocompleteField = value } |> withoutCmds

        UpdateText Radio value ->
            { model | radioField = value } |> withoutCmds

        UpdateText Select value ->
            { model | selectField = value, isSelectFieldOpen = False } |> withoutCmds

        UpdateText _ _ ->
            withoutCmds model

        UpdateAutocomplete Autocomplete value ->
            { model | autocompleteFilter = value } |> withoutCmds

        UpdateAutocomplete _ _ ->
            withoutCmds model

        UpdateFlag Checkbox value ->
            { model | checkboxField = value } |> withoutCmds

        UpdateFlag _ _ ->
            withoutCmds model

        UpdateDate Datepicker dpMsg ->
            let
                ( datepickerFieldInitialDP, _ ) =
                    DatePicker.init

                ( updatedDP, dpCmd, dateEvent ) =
                    DatePicker.update
                        datepickerSettings
                        dpMsg
                        (case model.datepicker of
                            Just datepicker ->
                                datepicker

                            Nothing ->
                                datepickerFieldInitialDP
                        )

                date =
                    case dateEvent of
                        DatePicker.NoChange ->
                            model.datepickerField

                        DatePicker.Changed chosenDate ->
                            chosenDate
            in
            { model | datepickerField = date, datepicker = Just updatedDP } |> withCmds [ Cmd.map (UpdateDate Datepicker) dpCmd ]

        UpdateDate _ _ ->
            withoutCmds model

        Toggle Select isOpen ->
            { model | isSelectFieldOpen = isOpen } |> withoutCmds

        Toggle _ _ ->
            withoutCmds model

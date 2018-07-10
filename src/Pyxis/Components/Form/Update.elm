module Pyxis.Components.Form.Update exposing (update)

import DatePicker exposing (DatePicker)
import Maybe.Extra exposing (isJust, isNothing)
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
import Pyxis.Ports as Ports


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchTodayDate todayDate ->
            { model
                | todayDate = Just todayDate
            }
                |> withoutCmds

        FormNoOp ->
            model |> withoutCmds

        Focus Autocomplete ->
            { model
                | isAutocompleteFieldOpen = True
                , isSelectFieldOpen = False
            }
                |> withoutCmds

        Focus Select ->
            { model
                | isSelectFieldOpen = True
                , isAutocompleteFieldOpen = False
            }
                |> withoutCmds

        Focus _ ->
            { model
                | isSelectFieldOpen = False
                , isAutocompleteFieldOpen = False
            }
                |> withoutCmds

        Blur Autocomplete ->
            { model
                | isAutocompleteFieldOpen = model.isAutocompleteFieldOpen
            }
                |> withoutCmds

        Blur _ ->
            { model
                | isAutocompleteFieldOpen = False
                , isSelectFieldOpen = False
            }
                |> withoutCmds

        UpdateText Text value ->
            { model
                | textField = value
            }
                |> withoutCmds

        UpdateText Autocomplete value ->
            { model
                | autocompleteField = value
                , autocompleteFilter = Nothing
                , isAutocompleteFieldOpen = isNothing value
            }
                |> withoutCmds

        UpdateText Radio value ->
            { model
                | radioField = value
            }
                |> withoutCmds

        UpdateText Select value ->
            { model
                | selectField = value
                , isSelectFieldOpen = False
            }
                |> withoutCmds

        UpdateText Textarea value ->
            { model
                | textareaField = value
            }
                |> withoutCmds

        UpdateText _ _ ->
            withoutCmds model

        UpdateFilter Autocomplete value ->
            { model
                | autocompleteFilter = value
                , isAutocompleteFieldOpen = True
            }
                |> withoutCmds

        UpdateFilter _ _ ->
            withoutCmds model

        UpdateFlag Checkbox value ->
            { model
                | checkboxField = value
            }
                |> withoutCmds

        UpdateFlag _ _ ->
            withoutCmds model

        UpdateMultiCheckbox MultiCheckbox slug isChecked ->
            { model
                | checkboxMultiField =
                    List.map
                        (\option ->
                            if option.slug == slug then
                                { option | isChecked = isChecked }
                            else
                                option
                        )
                        model.checkboxMultiField
            }
                |> withoutCmds

        UpdateMultiCheckbox _ _ _ ->
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
            { model
                | datepickerField = date
                , datepicker = Just updatedDP
                , isSelectFieldOpen = False
                , isAutocompleteFieldOpen = False
            }
                |> withCmds [ Cmd.map (UpdateDate Datepicker) dpCmd ]

        UpdateDate _ _ ->
            withoutCmds model

        Toggle Select isOpen ->
            { model
                | isSelectFieldOpen = isOpen
            }
                |> withoutCmds

        Toggle _ _ ->
            withoutCmds model

        ToggleDisable ->
            { model
                | formDisabled = not model.formDisabled
            }
                |> withoutCmds

        ToggleSeparation ->
            { model
                | showSeparated = not model.showSeparated
            }
                |> withoutCmds

        InspectHtml selector ->
            model |> withCmds [ Ports.inspectHtml selector ]

        ClickedOutside ->
            { model
                | isSelectFieldOpen = False
                , isAutocompleteFieldOpen = False
            }
                |> withoutCmds

module Pyxis.Components.Form.Update exposing (update)

import Date
import Maybe.Extra exposing (isJust, isNothing)
import Prima.DatePicker as DatePicker
import Pyxis.Components.Form.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        )
import Pyxis.Helpers
    exposing
        ( withCmds
        , withoutCmds
        )
import Pyxis.Ports as Ports
import Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchTodayDate todayDate ->
            let
                today =
                    Date.fromPosix Time.utc todayDate
            in
            { model
                | todayDate = Just todayDate
                , datepicker = Just <| DatePicker.init today ( today, today )
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

        Focus _ ->
            model |> withoutCmds

        Blur _ ->
            model |> withoutCmds

        UpdateText Text value ->
            { model
                | textField = value
            }
                |> withoutCmds

        UpdateText TextIcon value ->
            { model
                | textFieldIcon = value
            }
                |> withoutCmds

        UpdateText TextSmallFirst value ->
            { model
                | textFieldSmallFirst = value
            }
                |> withoutCmds

        UpdateText TextSmallLast value ->
            { model
                | textFieldSmallLast = value
            }
                |> withoutCmds

        UpdateText TextLarge value ->
            { model
                | textFieldLarge = value
            }
                |> withoutCmds

        UpdateText TextTooltip value ->
            { model
                | textFieldTooltip = value
            }
                |> withoutCmds

        UpdateText TextTooltipInfo value ->
            { model
                | textFieldTooltipInfo = value
            }
                |> withoutCmds

        UpdateText Password value ->
            { model
                | passwordField = value
            }
                |> withoutCmds

        UpdateText Autocomplete value ->
            let
                label =
                    (Maybe.map .name
                        << List.head
                        << List.filter ((==) (Maybe.withDefault "" value) << .code)
                    )
                        model.resources.countries
            in
            { model
                | autocompleteField = value
                , autocompleteFilter = label
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

        UpdateText Datepicker value ->
            { model
                | datepickerField = value
                , datepicker =
                    case (Maybe.Extra.join << Maybe.map (Result.toMaybe << Date.fromIsoString)) value of
                        Just date ->
                            Maybe.map (DatePicker.init date << .daysPickerRange) model.datepicker

                        _ ->
                            model.datepicker
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
                updatedInstance =
                    Maybe.map (DatePicker.update dpMsg) model.datepicker

                formatDate str =
                    (String.join "/" << List.reverse << String.split "-") str
            in
            { model
                | datepicker = updatedInstance
                , datepickerField = Maybe.map (formatDate << Date.toIsoString << DatePicker.selectedDate) updatedInstance
            }
                |> withoutCmds

        UpdateDate _ _ ->
            withoutCmds model

        Toggle Select isOpen ->
            { model
                | isSelectFieldOpen = isOpen
            }
                |> withoutCmds

        Toggle Datepicker isOpen ->
            { model
                | isDatePickerOpen = isOpen
            }
                |> withoutCmds

        Toggle _ _ ->
            withoutCmds model

        ToggleDisable ->
            { model
                | formDisabled = not model.formDisabled
            }
                |> withoutCmds

        InspectHtml selector ->
            model |> withCmds [ Ports.inspectHtml selector ]

        ClickedOutside ->
            { model
                | isSelectFieldOpen = False
                , isAutocompleteFieldOpen = False
                , isDatePickerOpen = False
            }
                |> withoutCmds

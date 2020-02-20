module FormTooltip.Update exposing (update)

import Date exposing (Date)
import FormTooltip.Model as Model
    exposing
        ( FieldName(..)
        , FormData
        , Model
        , Msg(..)
        , initialFormData
        )
import Prima.Pyxis.DatePicker as DatePicker
import Prima.Pyxis.Form as PyxisForm exposing (Form)


updateFormData : (FormData -> FormData) -> Model -> Model
updateFormData mapper model =
    { model
        | data = mapper model.data
    }


setAsTouched : Model -> Model
setAsTouched model =
    if PyxisForm.isFormSubmitted model.formConfig then
        model

    else
        { model
            | formConfig = PyxisForm.setAsTouched model.formConfig
        }


withoutCmds : Model -> ( Model, Cmd Msg )
withoutCmds model =
    ( model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateField Street value ->
            model
                |> updateFormData (\f -> { f | street = value })
                |> withoutCmds

        UpdateField HouseNumber value ->
            model
                |> updateFormData (\f -> { f | houseNumber = value })
                |> withoutCmds

        UpdateField DateOfBirth value ->
            let
                unwrap : Maybe (Maybe a) -> Maybe a
                unwrap theMaybe =
                    case theMaybe of
                        Just something ->
                            something

                        Nothing ->
                            Nothing
            in
            model
                |> updateFormData
                    (\f ->
                        { f
                            | dateOfBirth = value
                            , dateOfBirthDP =
                                case (unwrap << Maybe.map (Result.toMaybe << Date.fromIsoString)) value of
                                    Just date ->
                                        DatePicker.init date ( Model.lowDate, Model.highDate )

                                    _ ->
                                        f.dateOfBirthDP
                        }
                    )
                |> setAsTouched
                |> withoutCmds

        UpdateDatePicker DateOfBirth dpMsg ->
            let
                updatedInstance f =
                    DatePicker.update dpMsg f.dateOfBirthDP
            in
            model
                |> updateFormData (\f -> { f | dateOfBirthDP = updatedInstance f, dateOfBirth = (Just << Date.format "dd/MM/y" << DatePicker.selectedDate) (updatedInstance f) })
                |> setAsTouched
                |> withoutCmds

        ToggleDatePicker ->
            model
                |> updateFormData
                    (\f ->
                        { f
                            | isVisibleDP = not f.isVisibleDP
                        }
                    )
                |> setAsTouched
                |> withoutCmds

        OnFocus Street ->
            model
                |> updateFormData (\f -> { f | isFocusedAddress = True })
                |> withoutCmds

        OnFocus HouseNumber ->
            model
                |> updateFormData (\f -> { f | isFocusedAddress = True })
                |> withoutCmds

        OnBlur Street ->
            model
                |> updateFormData (\f -> { f | isFocusedAddress = False })
                |> withoutCmds

        OnBlur HouseNumber ->
            model
                |> updateFormData (\f -> { f | isFocusedAddress = False })
                |> withoutCmds

        _ ->
            withoutCmds model

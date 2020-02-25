module FormTooltip.Model exposing
    ( FieldName(..)
    , Flags
    , FormData
    , Label
    , Model
    , Msg(..)
    , Slug
    , highDate
    , initialDate
    , initialFormData
    , initialModel
    , lowDate
    )

import Date exposing (Date)
import Prima.Pyxis.DatePicker as DatePicker
import Prima.Pyxis.Form as PyxisForm exposing (ValidationVisibilityPolicy)
import Time exposing (Month(..))


type alias Model =
    { data : FormData
    , formConfig : PyxisForm.Form FormData Msg
    }


initialModel : Model
initialModel =
    Model initialFormData (PyxisForm.init PyxisForm.WhenSubmitted)


type alias FormData =
    { dateOfBirth : Maybe String
    , dateOfBirthDP : DatePicker.Model
    , isVisibleDP : Bool
    , street : Maybe String
    , houseNumber : Maybe String
    , isFocusedAddress : Bool
    }


initialFormData : FormData
initialFormData =
    FormData
        Nothing
        (DatePicker.init initialDate ( lowDate, highDate ))
        False
        Nothing
        Nothing
        False


type alias Flags =
    {}


type alias Label =
    String


type alias Slug =
    String


initialDate : Date
initialDate =
    Date.fromCalendarDate 2019 Feb 1


lowDate : Date
lowDate =
    Date.fromCalendarDate 2019 Jan 3


highDate : Date
highDate =
    Date.fromCalendarDate 2019 Apr 29


type FieldName
    = DateOfBirth
    | Street
    | HouseNumber


type Msg
    = UpdateField FieldName (Maybe String)
    | UpdateDatePicker FieldName DatePicker.Msg
    | UpdateDate FieldName (Maybe Date)
    | Toggle FieldName
    | FetchDateToday Date
    | OnFocus FieldName
    | OnBlur FieldName
    | ToggleDatePicker

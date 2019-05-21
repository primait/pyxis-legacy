module Pyxis.Components.Table.Model exposing
    ( Column(..)
    , Header(..)
    , Model
    , Msg(..)
    , Row(..)
    , Sort(..)
    , Table
    , initialModel
    )


type Msg
    = Sort
    | InspectHtml String


type alias Model =
    { tables : List Table
    , sortOrder : Maybe Sort
    }


initialModel : Model
initialModel =
    Model
        [ Table
            "countryTable"
            [ DefaultHeader "Country", SortableHeader "Capital" Sort ]
            [ Row [ DefaultColumn "Italy", DefaultColumn "Rome" ]
            , Row [ DefaultColumn "France", DefaultColumn "Paris" ]
            , Row [ DefaultColumn "U.K.", DefaultColumn "London" ]
            , Row [ DefaultColumn "U.S.A", DefaultColumn "Washington" ]
            ]
        ]
        Nothing


type alias Table =
    { slug : String
    , headers : List (Header Msg)
    , rows : List Row
    }


type Header msg
    = DefaultHeader String
    | SortableHeader String msg


type Row
    = Row (List Column)


type Column
    = DefaultColumn String
    | HtmlColumn String


type Sort
    = Asc
    | Desc

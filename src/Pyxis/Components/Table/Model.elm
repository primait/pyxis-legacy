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
    { tables : List ( String, Table )
    , sortOrder : Maybe Sort
    }


initialModel : Model
initialModel =
    Model
        [ ( "Presentational table", presentationalTable )
        , ( "Sortable table", sortableTable )
        ]
        Nothing


presentationalTable : Table
presentationalTable =
    Table
        "countryTable"
        [ DefaultHeader "Website", DefaultHeader "Speed Index" ]
        [ Row [ Column "Prima.it", Column "96" ]
        , Row [ Column "Facile.it", Column "82" ]
        , Row [ Column "Quixa", Column "36" ]
        ]


sortableTable : Table
sortableTable =
    Table
        "countryTable"
        [ SortableHeader "Country" Sort, DefaultHeader "Capital" ]
        [ Row [ Column "Italy", Column "Rome" ]
        , Row [ Column "France", Column "Paris" ]
        , Row [ Column "U.K.", Column "London" ]
        , Row [ Column "U.S.A", Column "Washington" ]
        ]


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
    = Column String


type Sort
    = Asc
    | Desc

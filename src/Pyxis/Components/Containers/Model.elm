module Pyxis.Components.Containers.Model exposing
    ( Container
    , Model
    , Msg(..)
    , initialModel
    )


type Msg
    = InspectHtml String


type alias Model =
    { containers : List Container }


initialModel : Model
initialModel =
    Model
        [ Container "Container XSmall" (Just "xsmall") "max-width: 540px" "min-width: 576px"
        , Container "Container Small" (Just "small") "max-width: 700px" "min-width: 768px"
        , Container "Container Medium" (Just "medium") "max-width: 960px" "min-width: 992px"
        , Container "Container Large" (Just "large") "max-width: 1140px" "min-width: 1200px"
        , Container "Container Xlarge" (Just "xlarge") "max-width: 1370px" "min-width: 1920px"
        , Container "Container Fluid" (Just "fluid") "width: 100px" ""
        ]


type alias Container =
    { name : String
    , dimension : Maybe String
    , description : String
    , breakpoint : String
    }

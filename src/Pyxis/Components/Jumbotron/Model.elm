module Pyxis.Components.Jumbotron.Model exposing
    ( Image
    , Jumbotron
    , Model
    , Msg(..)
    , initialModel
    )


type Msg
    = InspectHtml String


type alias Jumbotrons =
    List Jumbotron


type alias Model =
    { jumbotrons : List Jumbotron }


type alias Jumbotron =
    { title : String
    , subtitle : String
    , image : Maybe Image
    , content : Maybe String
    }


initialModel : Model
initialModel =
    { jumbotrons =
        [ Jumbotron "Titolo" "Sottotitolo" testImage <| Just <| "<p class='o-jumbotron__paragraph'>I'm a nice paragraph</p>"
        ]
    }


type alias Image =
    String


testImage : Maybe Image
testImage =
    Just "https://via.placeholder.com/480x205"

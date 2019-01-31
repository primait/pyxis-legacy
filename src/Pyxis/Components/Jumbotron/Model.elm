module Pyxis.Components.Jumbotron.Model exposing
    ( Image
    , Jumbotron
    , Model
    , Msg(..)
    , initialModel
    , jumbotronWithParagraph
    )


type Msg
    = InspectHtml String


type alias Model =
    List Jumbotron


type alias Jumbotron =
    { title : String
    , subtitle : String
    , image : Maybe Image
    , content : Maybe String
    }


initialModel : Model
initialModel =
    [ jumbotronWithParagraph
    ]


type alias Image =
    String


testImage : Maybe Image
testImage =
    Just "https://via.placeholder.com/480x205"


jumbotronWithParagraph : Jumbotron
jumbotronWithParagraph =
    Jumbotron "Titolo" "Sottotitolo" testImage (Just <| "<p class='o-jumbotron__paragraph'>I'm a nice paragraph</p>")

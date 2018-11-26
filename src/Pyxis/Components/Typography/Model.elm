module Pyxis.Components.Typography.Model exposing
    ( FontSize(..)
    , Model
    , Msg(..)
    , TypeFontSize
    , initialModel
    )


type Msg
    = InspectHtml String


type alias Model =
    { fontSizeList : List Font }


initialModel : Model
initialModel =
    Model
        [ fontBase
        , fontXsmall
        , fontSmall
        , fontMedium
        , fontLarge
        , fontXlarge
        , fontXxlarge
        ]


type alias Font =
    { dimension_ : FontSize
    }


fontBase : Font
fontBase =
    Font Base


fontXsmall : Font
fontXsmall =
    Font Xsmall


fontSmall : Font
fontSmall =
    Font Small


fontMedium : Font
fontMedium =
    Font Medium


fontLarge : Font
fontLarge =
    Font Large


fontXlarge : Font
fontXlarge =
    Font Xlarge


fontXxlarge : Font
fontXxlarge =
    Font Xxlarge


type FontSize
    = Base
    | Xsmall
    | Small
    | Medium
    | Large
    | Xlarge
    | Xxlarge


typeFontSize : FontSize -> Float
typeFontSize dimension_ =
    case dimension_ of
        Base ->
            1

        Xsmall ->
            0.75

        Small ->
            0.857

        Medium ->
            1.125

        Large ->
            1.375

        Xlarge ->
            1.562

        Xxlarge ->
            2

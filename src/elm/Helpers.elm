module Helpers exposing (..)

import Dict exposing (Dict)


withCmds : List (Cmd msg) -> model -> ( model, Cmd msg )
withCmds cmds model =
    ( model, Cmd.batch cmds )


withoutCmds : model -> ( model, Cmd msg )
withoutCmds =
    withCmds []


isJust : Maybe x -> Bool
isJust maybeVal =
    case maybeVal of
        Just _ ->
            True

        Nothing ->
            False


isNothing : Maybe x -> Bool
isNothing =
    not << isJust


{-|

    This function accepts a format string and a substitution list.
    The format string can contain zero or more named-placeholders surrounded
    by double curly braces (eg "... {{name}} ...").

    The function replaces all the placeholders with the values contained in the substitution list.
    Example:
        "I am {{age}} years old" |> strFormat [("name", "18")]
        outputs: "I am 18 years old"

-}
strFormat : List ( String, String ) -> String -> String
strFormat values format =
    values
        |> List.foldl (\( k, v ) s -> String.replace ("{{" ++ k ++ "}}") v s) format


type alias Translator =
    List ( String, String ) -> String -> String


type alias WithTranslator a =
    { a
        | translate : Translator
    }


i18nInit : List ( String, String ) -> Translator
i18nInit list =
    Dict.fromList list |> translate


{-|

    Returns the translated text contained in the currently loaded dictionary.
    If the dictionary key is missing, it returns the key

    The second argument is used to replace all the occurrences of {{...}}
    with the values contained in the association list.

-}
translate : Dict String String -> Translator
translate translations values key =
    let
        text =
            translations
                |> Dict.get key
                |> Maybe.withDefault key
    in
    strFormat values text

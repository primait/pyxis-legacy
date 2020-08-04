module Helpers exposing (..)

import Dict exposing (Dict)


withCmds : List (Cmd msg) -> model -> ( model, Cmd msg )
withCmds cmds model =
    ( model, Cmd.batch cmds )


withoutCmds : model -> ( model, Cmd msg )
withoutCmds =
    withCmds []


{-|

    This function accepts a format string and a substitution list.
    The format string can contain zero or more named-placeholders surrounded
    by double curly braces (eg "... {{name}} ...").

    The function replaces all the placeholders with the values contained in the substitution list.
    Example:
        strFormat "I am {{age}} years old" [("name", 18)]
        outputs: "I am 18 years old"

-}
strFormat : String -> List ( String, String ) -> String
strFormat format values =
    values
        |> List.foldl (\( k, v ) s -> String.replace ("{{" ++ k ++ "}}") v s) format


type alias Translator =
    String -> List ( String, String ) -> String


i18nInit : List ( String, String ) -> Translator
i18nInit list =
    Dict.fromList list |> t


{-|

    Returns the translated text contained in the currently loaded dictionary.
    If the dictionary key is missing, it returns the key

    The second argument is used to replace all the occurrences of {{...}}
    with the values contained in the association list.

-}
t : Dict String String -> Translator
t translations key values =
    let
        text =
            translations
                |> Dict.get key
                |> Maybe.withDefault key
    in
    strFormat text values

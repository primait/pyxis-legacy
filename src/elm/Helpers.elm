module Helpers exposing (..)

import Dict exposing (Dict)
import List


withCmds : List (Cmd msg) -> model -> ( model, Cmd msg )
withCmds cmds model =
    ( model, Cmd.batch cmds )


withoutCmds : model -> ( model, Cmd msg )
withoutCmds =
    withCmds []


{-| returns True if the a Maybe is Just, False otherwise
-}
isJust : Maybe x -> Bool
isJust maybeVal =
    case maybeVal of
        Just _ ->
            True

        Nothing ->
            False


{-| returns True if a Maybe is Nothing, False otherwise
-}
isNothing : Maybe x -> Bool
isNothing =
    not << isJust


{-| It returns a portion of the list, containing the elements between "start"
and "end" (end excluded).

ex. listSlice 2 4 [1, 2, 3, 4, 5, 6] -> [2, 3, 4]

The arguments can also be negative, representing the offset from the last element
of the list

-}
listSlice : Int -> Int -> List a -> List a
listSlice start end list =
    let
        adjustIndex index =
            if index < 0 then
                List.length list + index

            else
                index
    in
    list
        |> List.drop (adjustIndex start)
        |> List.take (adjustIndex end - adjustIndex start)


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

    ex. "My name is {{name}}" |> translate [("name", "John Doe")]
        -> "My name is John Doe"

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

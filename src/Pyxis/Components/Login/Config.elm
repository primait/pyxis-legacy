module Pyxis.Components.Login.Config exposing
    ( emailFieldConfig
    , passwordFieldConfig
    )

import Html.Attributes exposing (class, disabled, placeholder)
import Prima.Form as Form
    exposing
        ( FormField
        , FormFieldConfig
        , Validation(..)
        )
import Pyxis.Components.Login.Model
    exposing
        ( Field(..)
        , Model
        , Msg(..)
        )
import Regex exposing (Regex)


emailFieldConfig : FormField Model Msg
emailFieldConfig =
    Form.textConfig
        "text_field"
        (Just "Email")
        [ placeholder "user@email.com" ]
        .emailField
        (UpdateText Email)
        (Focus Email)
        (Blur Email)
        False
        (Just 1)
        [ NotEmpty "Empty value is not acceptable"
        , Expression validateEmail "Please enter valid email address"
        ]


validateEmail : Regex
validateEmail =
    Regex.regex "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$"


passwordFieldConfig : FormField Model Msg
passwordFieldConfig =
    Form.passwordConfig
        "password_field"
        (Just "Password")
        [ placeholder "password" ]
        .passwordField
        (UpdateText Password)
        (Focus Password)
        (Blur Password)
        False
        (Just 2)
        [ NotEmpty "Empty value is not acceptable"
        , Custom ((<=) 8 << String.length << Maybe.withDefault "" << .passwordField) "The value must be at least 8 characters length."
        ]

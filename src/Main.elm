module Main exposing (main)

{-|
@docs main
-}

import Html exposing (..)
import Html.A11y exposing (..)
import Html.CssHelpers
import Styles exposing (..)


{- VIEW -}


{-| view
-}
view : Model -> Html Msg
view model =
    div
        [ class [ Container ] ]
        [ Html.CssHelpers.style css
        , viewInputs
        ]


viewInputs : Html msg
viewInputs =
    let
        inputty typeAndValue =
            { label = text "Label"
            , typeAndValue = typeAndValue
            , attributes = []
            }
    in
        div []
            [ leftLabeledInput <| inputty (textInput "Tessa")
            , rightLabeledInput <| inputty (textInput "Tessa")
            , br [] []
            , leftLabeledInput <| inputty (radioInput "GroupName" "Radio 1" False)
            , rightLabeledInput <| inputty (radioInput "GroupName" "Radio 2" True)
            , br [] []
            , leftLabeledInput <| inputty (checkboxInput "Checkbox 1" (Just False))
            , leftLabeledInput <| inputty (checkboxInput "Checkbox 1" Nothing)
            , rightLabeledInput <| inputty (checkboxInput "Checkbox 2" (Just True))
            , invisibleLabeledInput (inputty (textInput "Is this hidden???")) "input-id"
            ]



{- MODEL -}


type alias Model =
    {}


model : Model
model =
    {}



{- UPDATE -}


{-| Msg
-}
type Msg
    = NoOp


{-| update
-}
update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


{-| main
-}
main : Program Never {} Msg
main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }

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
        , h1 [] [ text "Html.A11y View Examples" ]
        , h2 [] [ text "Inputs" ]
        , viewInputs
        ]


viewInputs : Html msg
viewInputs =
    div []
        [ viewTextInputVariations
        , viewRadioInputVariations
        , viewCheckboxInputVariations
        ]


viewTextInputVariations : Html msg
viewTextInputVariations =
    let
        inputModel =
            { label = text "Text Label"
            , typeAndValue = textInput "Value"
            , attributes = []
            }
    in
        viewInputType "Text"
            { left = [ inputModel ]
            , right = [ inputModel ]
            , invisible = [ (,) inputModel ("input-id-text") ]
            }


viewRadioInputVariations : Html msg
viewRadioInputVariations =
    let
        inputModel groupName =
            { label = text "Radio Label"
            , typeAndValue = radioInput groupName "Value" False
            , attributes = []
            }
    in
        viewInputType "Radio"
            { left = [ inputModel "left", inputModel "left" ]
            , right = [ inputModel "right", inputModel "right" ]
            , invisible =
                [ (,) (inputModel "invisible") ("input-id-radio-1")
                , (,) (inputModel "invisible") ("input-id-radio-2")
                ]
            }


viewCheckboxInputVariations : Html msg
viewCheckboxInputVariations =
    let
        inputModel status =
            { label = text <| "Checkbox Label, Status: " ++ toString status
            , typeAndValue = checkboxInput "Value" status
            , attributes = []
            }
    in
        viewInputType "Checkbox"
            { left = [ inputModel (Just True), inputModel Nothing, inputModel (Just False) ]
            , right = [ inputModel (Just True), inputModel Nothing, inputModel (Just False) ]
            , invisible =
                [ (,) (inputModel (Just True)) ("input-id-checkbox-1")
                , (,) (inputModel Nothing) ("input-id-checkbox-2")
                , (,) (inputModel (Just False)) ("input-id-checkbox-3")
                ]
            }


viewInputType :
    String
    -> { left : List (Input msg)
       , right : List (Input msg)
       , invisible : List ( Input msg, String )
       }
    -> Html msg
viewInputType name { left, right, invisible } =
    div []
        [ h3 [] [ text <| name ++ " Inputs" ]
        , leftLabeledInputHeader
        , div [] (List.map leftLabeledInput left)
        , rightLabeledInputHeader
        , div [] (List.map rightLabeledInput right)
        , invisibleLabeledInputHeader
        , div [] (List.map (uncurry invisibleLabeledInput) invisible)
        , br [] []
        ]


leftLabeledInputHeader : Html msg
leftLabeledInputHeader =
    h4 [] [ text "leftLabeledInput:" ]


rightLabeledInputHeader : Html msg
rightLabeledInputHeader =
    h4 [] [ text "rightLabeledInput:" ]


invisibleLabeledInputHeader : Html msg
invisibleLabeledInputHeader =
    h4 [] [ text "invisibleLabeledInput:" ]



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

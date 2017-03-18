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
            { left = [ leftLabeledInput inputModel ]
            , right = [ rightLabeledInput inputModel ]
            , invisible = [ invisibleLabeledInput inputModel ("input-id-text") ]
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
            { left =
                [ leftLabeledInput <| inputModel "left"
                , leftLabeledInput <| inputModel "left"
                ]
            , right =
                [ rightLabeledInput <| inputModel "right"
                , rightLabeledInput <| inputModel "right"
                ]
            , invisible =
                [ invisibleLabeledInput (inputModel "invisible") ("input-id-radio-1")
                , invisibleLabeledInput (inputModel "invisible") ("input-id-radio-2")
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
            { left =
                [ leftLabeledInput <| inputModel (Just True)
                , leftLabeledInput <| inputModel Nothing
                , leftLabeledInput <| inputModel (Just False)
                ]
            , right =
                [ rightLabeledInput <| inputModel (Just True)
                , rightLabeledInput <| inputModel Nothing
                , rightLabeledInput <| inputModel (Just False)
                ]
            , invisible =
                [ invisibleLabeledInput (inputModel (Just True)) ("input-id-checkbox-1")
                , invisibleLabeledInput (inputModel Nothing) ("input-id-checkbox-2")
                , invisibleLabeledInput (inputModel (Just False)) ("input-id-checkbox-3")
                ]
            }


viewInputType : String -> { left : List (Html msg), right : List (Html msg), invisible : List (Html msg) } -> Html msg
viewInputType name { left, right, invisible } =
    div []
        [ h3 [] [ text <| name ++ " Inputs" ]
        , leftLabeledInputHeader
        , div [] left
        , rightLabeledInputHeader
        , div [] right
        , invisibleLabeledInputHeader
        , div [] invisible
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

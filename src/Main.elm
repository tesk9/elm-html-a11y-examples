module Main exposing (main)

{-|
@docs main
-}

import Html exposing (..)
import Html.CssHelpers
import Styles exposing (..)
import Views.Inputs as Inputs


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
        , Inputs.view
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

module Main exposing (main)

{-|
@docs main
-}

import Html exposing (..)
import Html.CssHelpers
import Styles exposing (..)
import Views.Images as Images
import Views.Inputs as Inputs
import List.Zipper as Zipper
import Tabs.Model
import Tabs.Update
import Tabs.View


{- VIEW -}


{-| view
-}
view : Model -> Html Msg
view model =
    div
        [ class [ Container ] ]
        [ Html.CssHelpers.style css
        , h1 [] [ text "Html.A11y View Examples" ]
        , Html.map TabsMsg <| Tabs.View.view model.tabsModel
        ]


sectionHeader : String -> Html msg
sectionHeader header =
    h2 [] [ text header ]



{- MODEL -}


type alias Model =
    { tabsModel : Tabs.Model.Model }


model : Model
model =
    { tabsModel = tabsModel }


tabsModel : Tabs.Model.Model
tabsModel =
    { tabPanels =
        [ ( "Inputs", Inputs.view )
        , ( "Images", Images.view )
        ]
            |> List.indexedMap (\index ( header, content ) -> ( index, sectionHeader header, content ))
            |> Zipper.fromList
            |> Maybe.withDefault (Zipper.singleton ( 0, Html.text "failed", Html.text "failed" ))
    , groupId = "examples-container"
    }



{- UPDATE -}


{-| Msg
-}
type Msg
    = NoOp
    | TabsMsg Tabs.Update.Msg


{-| update
-}
update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        TabsMsg tabsMsg ->
            { model | tabsModel = Tabs.Update.update tabsMsg model.tabsModel }


{-| main
-}
main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }

module Views.Images exposing (view)

import Html exposing (..)
import Html.Attributes exposing (src, href)
import Html.A11y exposing (..)


view : Html msg
view =
    div []
        [ h3 [] [ text "img" ]
        , viewImageBlock "An informative image" <| Html.A11y.img "Elm Logo" [ src "./assets/elm-logo.png" ]
        , viewImageBlock "A decorative image" <| decorativeImg [ src "./assets/elm-logo.png" ]
        , viewImageBlock "A functional image" <| a [ href "http://package.elm-lang.org/" ] [ decorativeImg [ src "./assets/elm-logo.png" ] ]
        ]


viewImageBlock : String -> Html msg -> Html msg
viewImageBlock header content =
    div []
        [ h4 [] [ text header ]
        , content
        ]

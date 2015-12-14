module VideoList where


import List
import Signal
import Html exposing (ul, div, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Video

type alias Model = List (Video.Model)

view : Model -> Html.Html
view videos =
  div [] [
    div [class "video-list"] [
      ul [class "collection-container"]
        (List.map Video.view videos)
    ]
  ]

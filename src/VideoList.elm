module VideoList where


import List
import Html exposing (ul, div)
import Html.Attributes exposing (class)
import Video

type alias Model = List (Video.Model)

view : Model -> Html.Html
view videos =
  div [class "video-list"] [
    ul [class "collection-container"]
      (List.map Video.view videos)
  ]

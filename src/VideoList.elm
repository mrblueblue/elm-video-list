module VideoList where


import List
import Html

import Video

type alias Model = List (Video.Model)

view : Model -> Html.Html
view videos =
  Html.ul []
    (List.map Video.view videos)

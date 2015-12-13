module VideoList where

import Video
import List
import Html exposing (text, ul)


view videos =
  ul []
    (List.map (Video.view) videos)

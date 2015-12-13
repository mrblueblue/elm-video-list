module Video where

import Html


type alias Model =
  { title: String, id: String}

view video =
  Html.li [] [Html.text video.title]

module Video where

import Html exposing (li, text, div, img, h3, p, a)
import Html.Attributes exposing (class, src, style, href)
import Json.Encode exposing (string)

type alias Model =
  {
    duration: Int
    , thumbnail_180_url: String
    , title: String
    , url: String
    , id: String
    , screenname: String
    , title: String
    , views_total: Int
  }

view video =
  a [href video.url] [
    li [class "collection-item"] [
      div [class "thumbnail-container"] [
        div [
          style [
            ("background-image", "url('" ++ video.thumbnail_180_url ++ "')")
          ]
        ] []
      ]
      , div [class "content"] [
        h3 [class "title"] [text video.title]
        , p [class "subtitle"] [text video.screenname]
        , p [class "description"] [text (toString(video.views_total) ++ " views")]
      ]
    ]
  ]

import Signal
import List
import Html exposing (Html)
import VideoList


port videos: Signal VideoList.Model

main : Signal Html
main =
  Signal.map VideoList.view state

initialState = []

state: Signal VideoList.Model
state =
  Signal.foldp update initialState videos

update: VideoList.Model -> VideoList.Model -> VideoList.Model
update oldVideos newVideos =
  List.concat [oldVideos, newVideos]

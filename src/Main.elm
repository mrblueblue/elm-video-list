import Signal
import List
import Html
import VideoList


port videos: Signal VideoList.Model

main : Signal Html.Html
main =
  Signal.map VideoList.view state


state: Signal VideoList.Model
state =
  Signal.foldp update [] videos

update prevState newVideos =
  List.concat [prevState, newVideos]

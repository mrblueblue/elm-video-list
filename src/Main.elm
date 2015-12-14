import Signal
import List
import Html exposing (Html, text, div)
import Components exposing (loading)
import VideoList


port videos: Signal State

type alias State =
  { videos: VideoList.Model
    , loading: Bool
  }

app: State -> Html
app state =
    div [] [
      VideoList.view state.videos
      , loading state.loading
    ]

initialState: State
initialState =
  { videos = []
    , loading = False
  }

state: Signal State
state =
  Signal.foldp update initialState videos

update: State -> State -> State
update next state =
  { videos = List.concat [state.videos, next.videos]
    , loading = next.loading
  }

main : Signal Html
main =
  Signal.map app state

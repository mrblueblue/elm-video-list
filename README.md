# elm-video-list

A [Dailymotion](http://www.dailymotion.com) video list written in Elm.

Currently, Elm is only the view layer. Data is fetched with Javascript, and the repsonse is sent to Elm through `ports`.

# Getting Started

```bash
elm make ./src/Main.elm --output=./src/js/elm.js
open ./src/index.html
```

var pageNumber = 1;
var loading = false;
var has_more = true;

var App = Elm.fullscreen(Elm.Main, {videos: []});
var xhr = new XMLHttpRequest();

var getVideos = function(number){
  if (loading || !has_more){
    return;
  }

  var url = "https://api.dailymotion.com/videos?";

  var data = [
    "duration",
    "owner.screenname",
    "thumbnail_180_url",
    "title",
    "url",
    "id",
    "views_total"
  ]

  var page = "page=" + number;
  var fields = "&fields=" + data.join("%2C");
  var limit = "&limit=20";
  var list = "&list=what-to-watch"

  var endpoint = url + page + fields + limit + list;

  xhr.open("GET", endpoint)
  xhr.send();
  loading = true;
  pageNumber = pageNumber + 1;
}

var throttle = function(callback, limit) {
  var wait = false;
  return function () {
    if (!wait) {
      callback.call();
      wait = true;
      setTimeout(function () {
        wait = false
      }, limit);
    }
  }
}

var onScroll = throttle(function(event){
  var scrollTop = window.pageYOffset;
  var scrollPosition = scrollTop + document.documentElement.clientHeight;
  var delta = document.documentElement.offsetHeight - scrollPosition;
  var limit = document.documentElement.clientHeight * 0.8;

  console.log(delta, limit)
  if (delta < limit){
    getVideos(pageNumber);
  }
}, 500)

var onreadystatechange = function(){
  loading = false;
  if (xhr.readyState === 4 && xhr.status === 200) {
    var response = JSON.parse(xhr.responseText)
    var videos = response.list

    if (!response.has_more){
      alert('no more videos to fetch!');
      return;
    }

    videos.forEach(function(video, index){
      var screenname = video["owner.screenname"];
      video.screenname = screenname;
      delete video["owner.screenname"];
    });

    App.ports.videos.send(videos);
  }
}

xhr.onreadystatechange = onreadystatechange;
window.addEventListener("scroll", onScroll);

getVideos(pageNumber);

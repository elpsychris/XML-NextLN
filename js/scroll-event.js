var scrollCount = 0;
var latestScrollPos = 0;
var doc = document.documentElement;
var curPos = this.window.innerHeight;
var sideWindow = document.getElementById("side-window");

window.addEventListener('scroll', function (e) {
    var curScrollPos = window.pageYOffset;
    this.console.log("new event 2", curScrollPos, latestScrollPos)    
    if (curScrollPos > latestScrollPos) {
        if (sideWindow != null) {
            sideWindow.style.display = "block";
            sideWindow.classList.add("fadeInLeft");
            if (sideWindow.classList.contains("fadeOutLeft")) {
                sideWindow.classList.remove("fadeOutLeft");
            }
        }
    } else {
        if (sideWindow != null) {
            sideWindow.classList.remove("fadeInLeft");
            sideWindow.classList.add("fadeOutLeft");
        }
    }
    latestScrollPos = curScrollPos;
});
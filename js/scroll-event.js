var scrollCount = 0;
var latestScrollPos = 0;
var doc = document.documentElement;
var curPos = window.innerHeight;

window.addEventListener('scroll', function (e) {
    var sideWindow = document.getElementById("side-window");
    var curScrollPos = window.pageYOffset;
    var navTopBar = document.getElementById("nav-top-bar");
    var windowE = document.getElementById('user-window');

    this.console.log("new event 2", curScrollPos, latestScrollPos)
    if (curScrollPos > latestScrollPos) {
        if (sideWindow != null) {
            sideWindow.style.display = "block";
            sideWindow.classList.add("fadeInLeft");
            if (sideWindow.classList.contains("fadeOutLeft")) {
                sideWindow.classList.remove("fadeOutLeft");
            }
        }


        if (navTopBar != null &&
            windowE.style.display == "none") {
            navTopBar.className = "nav-bar card-2 animated";
            navTopBar.classList.add("fadeOutUp");
            this.setTimeout(function () {
                if (navTopBar != null && navTopBar.style.display == 'flex') {
                    navTopBar.style.display = 'none';
                }
            }, 300);
        }
    } else {
        if (sideWindow != null) {
            sideWindow.classList.remove("fadeInLeft");
            sideWindow.classList.add("fadeOutLeft");
        }

        if (navTopBar != null && windowE != null &&
            navTopBar.classList.contains("fadeOutUp")) {
            navTopBar.className = "nav-bar card-2 animated";
            navTopBar.classList.add("fadeInDown");
            navTopBar.style.display = 'flex';
        }
    }


    latestScrollPos = curScrollPos;
});
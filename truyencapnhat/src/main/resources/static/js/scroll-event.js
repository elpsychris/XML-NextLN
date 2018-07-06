var scrollCount = 0;
var latestScrollPos = 0;
var doc = document.documentElement;
var curPos = window.innerHeight;
var lockScroll = false;

window.addEventListener('scroll', function (e) {
    if (lockScroll) {
        return;
    }
    var sideWindow = document.getElementById("side-window");
    var curScrollPos = window.pageYOffset;
    var navTopBar = document.getElementById("nav-top-bar");
    var windowE = document.getElementById('user-window');

    if (curScrollPos > latestScrollPos) {
        if (sideWindow != null) {
            sideWindow.style.display = "block";
            sideWindow.classList.add("fadeInLeft");
            if (sideWindow.classList.contains("fadeOutLeft")) {
                sideWindow.classList.remove("fadeOutLeft");
            }
        }


        if (navTopBar != null
            && getComputedStyle(windowE).display === 'none') {
            navTopBar.className = "nav-bar card-2 animated";
            navTopBar.classList.add("fadeOutUp");
            this.setTimeout(function () {
                if (navTopBar != null && getComputedStyle(navTopBar).display === 'flex') {
                    navTopBar.style.display = 'none';
                }
            }, 200);
        }
    } else {
        if (sideWindow != null) {
            console.log("side hide");
            sideWindow.classList.remove("fadeInLeft");
            sideWindow.classList.add("fadeOutLeft");
            this.setTimeout(function () {
                if (sideWindow.classList.contains("fadeOutLeft")) {
                    sideWindow.style.display = "none";
                    sideWindow.classList.remove("fadeOutLeft");
                }
            }, 200);
        }

        if (navTopBar != null && windowE != null) {
            navTopBar.className = "nav-bar card-2 animated";
            navTopBar.classList.add("fadeInDown");
            navTopBar.style.display = 'flex';
        }
    }


    latestScrollPos = curScrollPos;
});
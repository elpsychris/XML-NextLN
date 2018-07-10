var sideWindowE = document.getElementById("side-window");
var scrollCursor = document.getElementById("side-scroll");
var navBar = sideWindowE.getElementsByClassName("project-nav")[0];


function setSizeScroll() {
    var showingTab = sideWindowE.getElementsByClassName("tab-content show")[0];
    var topMargin = navBar.clientHeight;
    var ratio = (sideWindowE.clientHeight - topMargin) / showingTab.clientHeight;
    if (ratio > 1) {
        scrollCursor.style.display = "none";
    } else {
        scrollCursor.style.display = "block";
    }
    var height = ratio * sideWindowE.clientHeight;
    scrollCursor.style.height = height;
    scrollCursor.style.top = topMargin;
};

function setScrollTo(x) {
    var showingTab = sideWindowE.getElementsByClassName("tab-content show")[0];
    var topMargin = navBar.clientHeight;
    scrollCursor.style.top = x;
    showingTab.style.top = 0;
}

sideWindowE.addEventListener("wheel", function (ev) {
    setSizeScroll();
    disableScroll();
    var showingTab = sideWindowE.getElementsByClassName("tab-content show")[0];

    var topMargin = navBar.clientHeight;
    var ratio = (sideWindowE.clientHeight - topMargin) / showingTab.clientHeight;
    if (ratio > 1) {
        return;
    }
    var y = ev.deltaY;
    var newVal = scrollCursor.offsetTop + y;
    if (newVal < topMargin) {
        newVal = topMargin;
    }
    if (newVal + scrollCursor.clientHeight > sideWindowE.clientHeight - topMargin) {
        newVal = sideWindowE.clientHeight - scrollCursor.clientHeight;
    }

    scrollCursor.style.top = newVal;
    showingTab.style.top = -(newVal - topMargin) / ratio;
    setTimeout(function () {
        enableScroll();
    }, 200);
});
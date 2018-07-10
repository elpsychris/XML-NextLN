var cacheDoc = {};
var parserDOM = new DOMParser();
var xsltProc = new XSLTProcessor();
var chapterTable = document.getElementById("chapter-table");
var defaultXSL = document.getElementById("xsl");
var curProjectId = defaultXSL.classList[0];


if (defaultXSL != null && defaultXSL.childNodes[0] != null) {
    defaultXSL = parserDOM.parseFromString(defaultXSL.childNodes[0].textContent, "application/xml");

    xsltProc.importStylesheet(defaultXSL);
}

function showCache(num) {
    lockScroll = true;

    if (cacheDoc[num] == null) {
        onLoadCache([num], true);
    } else {
        var html = xsltProc.transformToFragment(cacheDoc[num], document);
        chapterTable.innerHTML = "";
        chapterTable.appendChild(html);
    }

    setTimeout(function () {
        lockScroll = false;
        // setScrollTo(0);
    }, 200);
}
function loadSelect(el, val) {
    if (el == null) {
        return;
    }

    for (var i = 0; i < el.options.length; i++) {
        if (el.options[i].value == val) {
            el.selectedIndex = i;
        }
    }
}
function onLoadScore() {
    var bookmarkBtn = document.getElementsByClassName("bookmark-btn")[0];
    var myRate = document.getElementsByClassName("your-rate")[0];
    var ratingSelect = document.getElementById("rating");

    if (bookmarkBtn != null) {
        var projectId = bookmarkBtn.id.replace("book-project-","");
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function (ev) {
            if (this.status == 200 && this.readyState == 4) {
                if (this.responseText != null && this.responseText.length > 0) {
                    myRate.textContent = this.responseText;
                    loadSelect(ratingSelect, this.responseText);
                    myRate.classList.add("bounceIn");
                    setTimeout(function () {
                        myRate.classList.remove("bounceIn");
                    }, 200);
                }
            }
        };

        xhr.open("GET", "/api/rating/" + projectId);
        xhr.send();
    }
}

function onLoadCache(num, isShow) {
    if (isShow == null) {
        isShow = false;
    }

    for (var i = 0; i < num.length; i++) {
        if (cacheDoc[num[i]] == null) {
            (function () {
                var number = num[i];
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (this.status == 200 && this.readyState == 4) {
                        console.log("add " + number);
                        var doc = parserDOM.parseFromString(this.responseText, "application/xml");
                        getProjectObject(doc);
                        cacheDoc[number] = doc;

                        if (isShow) {
                            chapterTable.innerHTML = "";
                            var html = xsltProc.transformToFragment(doc, document);
                            chapterTable.appendChild(html);
                        }
                    }
                };
                if (isShow) {
                    xhr.open("GET", "/api/updates/" + curProjectId + "/" + num[i], false);
                } else {
                    xhr.open("GET", "/api/updates/" + curProjectId + "/" + num[i]);
                }
                xhr.overrideMimeType('application/xml');
                xhr.send();
            })();
        }
    }
}

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

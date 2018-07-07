var cacheDoc = {};
var subCacheDoc = {};

var parserDOM = new DOMParser();

var xsltProc = new XSLTProcessor();
var xsltProcProject = new XSLTProcessor();

var chapterTable = document.getElementById("latest-table");
var defaultXSL = document.getElementById("xsl");
var projectXSL = document.getElementById("project-xsl");

if (defaultXSL != null && defaultXSL.childNodes[0] != null) {
    defaultXSL = parserDOM.parseFromString(defaultXSL.childNodes[0].textContent, "application/xml");
    xsltProc.importStylesheet(defaultXSL);

    projectXSL = parserDOM.parseFromString(projectXSL.childNodes[0].textContent, "application/xml");
    xsltProcProject.importStylesheet(projectXSL);
}

function showCache(num, subId) {
    lockScroll = true;
    var subTable = null;
    var targetCache = cacheDoc;
    var targetProc = xsltProc;

    if (subId != null) {
        subTable = document.getElementById(subId);
        if (subTable == null) {
            return;
        } else {
            targetCache = subCacheDoc;
            targetProc = xsltProcProject;
        }
    }

    if (targetCache[num] == null) {
        onLoadCache([num], true, subId);
    } else {
        var html = targetProc.transformToFragment(targetCache[num], document);

        var target = chapterTable;
        if (subTable != null) {
            target = subTable;
        }

        target.innerHTML = "";
        target.appendChild(html);
    }

    setTimeout(function () {
        lockScroll = false;
        // setScrollTo(0);
    }, 200);
}

function onLoadCache(num, isShow, subId) {
    if (isShow == null) {
        isShow = false;
    }
    var subTable = null;
    var targetCache = cacheDoc;
    var targetProc = xsltProc;

    if (subId != null) {
        subTable = document.getElementById(subId);
        if (subTable == null) {
            return;
        } else {
            targetCache = subCacheDoc;
            targetProc = xsltProcProject;
        }
    }

    for (var i = 0; i < num.length; i++) {
        if (targetCache[num[i]] == null) {
            (function () {
                var number = num[i];
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (this.status == 200 && this.readyState == 4) {
                        console.log("add " + number, subId);
                        var doc = parserDOM.parseFromString(this.responseText, "application/xml");
                        targetCache[number] = doc;

                        if (subId != null) {
                            getProjectObject(doc);
                        }

                        if (isShow) {
                            var target = chapterTable;
                            if (subTable != null) {
                                target = subTable;
                            }

                            target.innerHTML = "";
                            var html = targetProc.transformToFragment(doc, document);
                            target.appendChild(html);
                        }
                    }
                };
                if (subTable != null) {
                    if (isShow) {
                        xhr.open("GET", "/api/projects/mostview/" + num[i], false);
                    } else {
                        xhr.open("GET", "/api/projects/mostview/" + num[i]);
                    }
                } else {
                    if (isShow) {
                        xhr.open("GET", "/api/updates/latest/" + num[i], false);
                    } else {
                        xhr.open("GET", "/api/updates/latest/" + num[i]);
                    }
                }
                xhr.overrideMimeType('application/xml');
                xhr.send();
            })();
        }
    }
}

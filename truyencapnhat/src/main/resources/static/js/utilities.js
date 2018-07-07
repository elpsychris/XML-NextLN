changeTab = function (tabEl, childId) {
    removeClassFromClassGroup("focus", "tab-button");
    tabEl.classList.add("focus");
    changeTabContent(childId);
};

changeTabContent = function (childId) {
    removeClassFromClassGroup("show", "tab-content");
    var allTabContent = document.getElementsByClassName("tab-content");
    allTabContent[childId].classList.add("show");
};

removeClassFromClassGroup = function (kw, className) {
    var allEl = document.getElementsByClassName(className);
    for (var i = 0; i < allEl.length; i++) {
        var curEl = allEl[i];
        if (curEl.classList.contains(kw)) {
            curEl.classList.remove(kw);
        }
    }
};
function XML2Obj(xmlString) {

}
function obj2XML(obj, name, ns) {
    var xmlText = createStartTag(name, ns, true);
    for (prop in obj) {
        xmlText += createStartTag(prop, ns, false) + obj[prop] + createEndTag(prop, ns);
    }
    xmlText += createEndTag(name, ns);
    return xmlText;
}

function createEndTag(tagName, ns) {
    var prefix = "p";
    if (ns != null) {
        tagName = prefix + ":" + tagName;
    }
    return "</" + tagName + ">";
}

function createStartTag(tagName, ns, isFirst) {
    var prefix = "p";
    var nsDeclare = "";
    if (ns != null){
        tagName = prefix + ":" + tagName;
        if (isFirst) {
            nsDeclare = nsDeclare + " xmlns:p='" + ns + "'"
        }
    }
    return "<" + tagName + nsDeclare + ">";
}

function renderPagination(e, pageNo, total, size, subId) {
    if (e.tagName == null) {
        e = document.getElementById(e);
    }
    if (e != null) {
        if (total == null) {
            var totalE = e.getElementsByClassName("total")[0];
            total = parseInt(totalE.textContent);
        }

        var paginationE = document.createElement("div");
        paginationE.classList.add("pagination");
        var startNo = 0;
        var endNo = 0;
        var maxNo = Math.ceil(total/size, 10);
        if (pageNo > 1) {
            paginationE.classList.add("hasPrev");
            startNo = pageNo - 1;
        } else {
            startNo = 1;
        }

        if (pageNo + 3 < maxNo) {
            paginationE.classList.add("hasNext");
        }
        if (startNo + 3 > maxNo) {
            endNo = maxNo;
        } else {
            endNo = startNo + 3;
        }

        for (var i = startNo; i <= endNo; i++) {
            var pageLink = document.createElement("a");
            pageLink.appendChild(document.createTextNode(i));
            (function() {
                var num = i;
                if (num != pageNo) {
                    pageLink.addEventListener("click", function() {
                        showCache(parseInt(num), subId);
                        renderPagination(e, parseInt(num), total, size, subId);
                    });
                }
            })();
            if (i == pageNo) {
                pageLink.classList.add("cur");
            }

            paginationE.appendChild(pageLink);
        }
        e.appendChild(paginationE);

        setTimeout(function () {
            var tobeload = [];
            if (endNo + 1 <= maxNo) {
                endNo = endNo + 1;
            }

            for (var i = endNo - 3; i <= endNo; i++) {
                tobeload.push(i);
            }
            onLoadCache(tobeload, false, subId);
        }, 1000)
    }
}
var isResultClicked = false;
var resultTable = document.getElementById("result-table");
var totalPage = 0;
var cur = 0;
var filterSet = {};
var curKeyword = "";
var moreUpdates = 0;
var moreViews = 0;

function onSearchBarFocus(e) {
    if (resultTable == null) {
        var dropdownList = document.getElementById("result-drop");
        if (dropdownList != null) {
            dropdownList.style.display = "block";
        }
    }
}

function onChangeFilter(e) {
    var filter = e.id;
    var value = e.checked;
    if (filter != null) {
        var exist = filterSet[filter];
        if (exist == null) {
            filterSet[filter] = value;
        } else {
            filterSet[filter] = value;
        }
    }
    searchDetail(curKeyword);
}

function onSearchBarBlur(e) {
    if (resultTable == null) {
        var dropdownList = document.getElementById("result-drop");
        setTimeout(function () {
            if (!isResultClicked) {
                dropdownList.style.display = "none";
            }
            isResultClicked = false;
        }, 200);
    }
}

function onSearchBarTyping(e) {
    var keyword = e.value.toLowerCase();
    curKeyword = keyword;
    totalPage = 0;
    cur = 0;
    getProjectObject(null);
    if (resultTable != null) {
        searchDetail(keyword);
        return;
    }
    var dropdownList = document.getElementById("result-drop");
    if (dropdownList != null) {
        dropdownList.style.display = "block";
        dropdownList.innerHTML = "";

        var result = searchProjectLocal(keyword);
        if (result != null) {

            for (var i = 0; i < result.length; i++) {
                var project = result[i];
                if (project["name"].trim() != "") {
                    var newResult = document.createElement("li");
                    newResult.appendChild(document.createTextNode(project["name"]));
                    newResult.addEventListener("click", function () {
                        isResultClicked = true;
                    });

                    var link = document.createElement("a");
                    link.className = "result";
                    link.setAttribute("href", "/project-detail?name=" + project["id"]);
                    link.appendChild(newResult);

                    dropdownList.appendChild(link);
                }

            }
        }

        var findMore = document.createElement("li");
        findMore.appendChild(document.createTextNode("Tìm kiếm chi tiết hơn..."));

        var link = document.createElement("a");
        link.setAttribute("href", "/search?keyword=" + keyword);
        link.appendChild(findMore);

        dropdownList.appendChild(link);
    }
}

function findMore(e) {
    if (totalPage === 0) {
        searchMoreOnline(curKeyword);
    } else {
        if (cur + 1 <= totalPage) {
            cur++;
            searchMoreOnline(curKeyword, cur);
        }
    }

    searchDetail(curKeyword);
    if (cur + 1 > totalPage) {
        var showMoreBtn = document.getElementById("more-result");
        showMoreBtn.style.display = "none";
    }
}
function onDoFilter(project) {
    if (filterSet == null) {
        return true;
    }
    var curGenre = project["genres"];
    if (curGenre == null) {
        return true;
    }
    curGenre = curGenre.toLowerCase();
    for (var filter in filterSet) {
        if (filterSet[filter] && curGenre.indexOf(filter) == -1) {
            return false;
        }
    }
    console.log(project["name"], " passed");
    return true;
}
function searchDetail(keyword) {
    curKeyword = keyword;
    getProjectObject(null);
    if (projectPool != null) {
        if (resultTable != null) {
            var oldRows = resultTable.getElementsByClassName("row-card");
            while (oldRows.length > 0) {
                oldRows[0].remove();
                oldRows = resultTable.getElementsByClassName("row-card");
            }
        }
        var result = searchProjectLocal(keyword);
        var count = result.length;

        if (cur < 1) {
            searchMoreOnline(keyword);
        }

        if (count < 10) {
            result = searchProjectLocal(keyword);
            count = result.length;
        }

        var rsNo = document.getElementById("total-result");

        if (count > 0) {
            hideNoResult();
            var msg = "";
            if (Math.floor(count / 10) > 0) {
                msg = "Hơn " + Math.floor(count / 10) * 10 + " kết quả";
            } else {
                msg = count + " kết quả";
            }
            rsNo.innerHTML = "";
            rsNo.appendChild(document.createTextNode(msg));
        } else {
            showNoResult();
            rsNo.innerHTML = "";
        }

        for (var i = 0; i < result.length; i++) {
            createSearchResultDetail(result[i]);
        }
    }
}

function searchMoreOnline(keyword, total) {
    if (total == null) {
        total = 1;
    }
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var doc = parserDOM.parseFromString(this.responseText, "application/xml");
            var totalRs = doc.evaluate("//*[local-name()='total']", doc, null, XPathResult.NUMBER_TYPE, null);
            if (totalRs != null) {
                totalRs = totalRs.numberValue;
            }
            if (totalRs != null && totalRs > 0) {
                totalPage = Math.ceil(totalRs / 20);
                if (cur == 0) {
                    cur = 1;
                }

                if (totalPage > cur) {
                    var showMoreBtn = document.getElementById("more-result");
                    showMoreBtn.style.display = "block";
                    if (cur > 1) {
                        searchDetail(keyword);
                    }
                }
                getProjectObject(doc);
            }
        }
    };

    xhr.overrideMimeType("application/xml");
    xhr.open("GET", "/api/projects/search/" + keyword + "/" + total);
    xhr.send();
}

function showNoResult() {
    var noResultMsg = document.getElementById("no-result");
    var resultHeader = document.getElementById("result-header");

    noResultMsg.style.display = "block";
    resultHeader.style.display = "none";
}

function hideNoResult() {
    var noResultMsg = document.getElementById("no-result");
    var resultHeader = document.getElementById("result-header");

    noResultMsg.style.display = "none";
    resultHeader.style.display = "flex";
}


function createSearchResultDetail(project) {
    if (project == null) {
        return;
    }
    var newRow = document.createElement("div");
    newRow.className = "row-card";

    var colClass = "col";
    var nameCol = document.createElement("div");
    nameCol.className = colClass + " project-name";

    var link = document.createElement("a");
    link.setAttribute("href", "/project-detail?name=" + project["id"]);
    link.appendChild(document.createTextNode(project["name"]));

    nameCol.appendChild(link);
    newRow.appendChild(nameCol);

    var authorCol = document.createElement("div");
    authorCol.className = colClass;
    authorCol.appendChild(document.createTextNode(project["author"]));
    newRow.appendChild(authorCol);

    var lastUpdateCol = document.createElement("div");
    lastUpdateCol.className = colClass;
    var lDate = parseInt(project["last_update"]);
    var date = new Date(lDate);
    console.log(date.toLocaleDateString());
    lastUpdateCol.appendChild(document.createTextNode(project["last_update"]));
    newRow.appendChild(lastUpdateCol);

    var viewCol = document.createElement("div");
    viewCol.className = colClass;
    viewCol.appendChild(document.createTextNode(project["view"]));
    newRow.appendChild(viewCol);

    var updatesCol = document.createElement("div");
    updatesCol.className = colClass;
    updatesCol.appendChild(document.createTextNode(project["total_update"]));
    newRow.appendChild(updatesCol);

    resultTable.appendChild(newRow);
}

function searchProjectLocal(keyword) {
    var result = [];
    // project-transform
    if (projectPool == null) {
        return;
    }

    for (var projectName in projectPool) {
        if (projectName.toLowerCase().indexOf(keyword.toLowerCase()) !== -1 && onDoFilter(projectPool[projectName])) {
            result.push(projectPool[projectName]);
        }
    }
    return result;
}
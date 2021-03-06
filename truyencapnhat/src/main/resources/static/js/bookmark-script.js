var bookmarkList = null;
var projectBookList = [];
var checkoutBookList = [];
var isSetBookmark = false;

bookmarkList = getSavedList();
checkoutBookList = getSavedCheckoutList();




setBookmarkStatus();


function onBookmarkItemClick() {
    var id = this.id.replace("bookmark-card-", "");
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var doc = parserDOM.parseFromString(this.responseText, "application/xml");
            updateBookmarkInfo(doc);
            updateCheckoutInfo(doc);
            window.location.href = "/project-detail?name=" + id;
            saveList();
        }
    };
    xhr.open("POST", "/api/bookmark/checkout/" + id);
    xhr.send();

}

function loadProjectInfo() {
    getProjectObject(null);
    getBookmarkInfo();
}

function convertToItem() {
    var tempCheckout = [];
    if (bookmarkList != null && bookmarkList.length > 0 && projectPool != null) {
        if (projectBookList == null) {
            projectBookList = [];
        }
        if (checkoutBookList == null) {
            checkoutBookList = [];
        }
        for (var projectName in projectPool) {
            var curProject = projectPool[projectName];
            var id = curProject["id"];

            if (bookmarkList.includes(id)) {
                var bookmarkItem = createBookmarkItem(curProject);
                projectBookList.push(bookmarkItem);
                if (checkoutBookList.includes(id)) {
                    tempCheckout.push(bookmarkItem);
                }
            }
        }

        if (projectBookList.length > 1) {
            projectBookList.sort(function (a, b) {
                return b["time"].getTime() - a["time"].getTime();
            })
        }
    }
    return tempCheckout;
}

function showBookmarkItem(checkout) {
    var bookmarkPanel = document.getElementById("bookmark-list");
    if (projectBookList != null && bookmarkPanel != null) {
        bookmarkPanel.innerHTML = "";
        if (checkoutBookList == null) {
            checkoutBookList = [];
        }

        for (var i = 0; i < projectBookList.length; i++) {
            var item = projectBookList[i]["e"];
            if (item != null && !checkout.includes(projectBookList[i])) {
                bookmarkPanel.appendChild(item);
            }
        }

        for (var i = 0; i < checkout.length; i++) {
            var item = checkout[i]["e"];
            if (item != null) {
                item.classList.add("checked-out");
                bookmarkPanel.appendChild(item);
            }
        }
    }
}

function stringToDate(stringDate) {
    if (stringDate == null) {
        return new Date();
    }
    var pattern = /^(\d{1,2})\/(\d{1,2})\/(\d{4}) (\d{1,2}):(\d{1,2})$/;
    var dateArray = stringDate.match(pattern);
    var date = new Date();
    if (dateArray != null && dateArray.length === 6) {
        date = new Date(dateArray[3], dateArray[2] - 1, dateArray[1], dateArray[4], dateArray[5]);
    }
    return date;
}

function onMouseOverBookmark() {
    var bookmarkList = document.getElementById("bookmark-list");
    var contentWrapper = document.getElementsByClassName("content-wrapper")[0];

    var lowerBound = contentWrapper.clientHeight - bookmarkList.clientHeight;
    var parentHeight = contentWrapper.clientHeight;
    var dist = this.getBoundingClientRect().top - contentWrapper.getBoundingClientRect().top;

    if (dist > 0.6 * parentHeight) {
        var newTop = bookmarkList.offsetTop - (dist - .5 * parentHeight);
        if (newTop < lowerBound) {
            newTop = lowerBound;
        }
        bookmarkList.style.top = newTop + "px";
    } else if (dist < .4) {
        var newTop = bookmarkList.offsetTop + (.5 * parentHeight - dist);
        if (newTop > 0) {
            newTop = 0;
        }
        bookmarkList.style.top = newTop + "px";
    }
}

function createBookmarkItem(project) {
    var itemCardE = document.createElement("div");
    itemCardE.className = "item card-1";
    itemCardE.setAttribute("id", "bookmark-card-" + project["id"]);

    itemCardE.addEventListener("click", onBookmarkItemClick.bind(itemCardE), false);
    itemCardE.addEventListener("mouseover",onMouseOverBookmark.bind(itemCardE));

    var thumbE = document.createElement("div");
    thumbE.className = "thumb";
    if (project["cover"] != null && project["cover"].length > 0) {
        var cover = project["cover"];
        if (cover.indexOf(";") > 0) {
            cover = cover.split(";")[0];
        }
        thumbE.style.background = "linear-gradient(to right, rgba(255, 255, 255, 0) 20%, rgba(255, 255, 255, 1)), url('"+ cover + "')";
    }

    var infoE = document.createElement("div");
    infoE.className = "info";

    var nameE = document.createElement("span");
    nameE.className = "info-name bookmark-info";
    var shortName = project["name"].length > 20 ? project["name"].substring(0, 20) + "..." : project["name"];
    nameE.appendChild(document.createTextNode(shortName));

    var chapterE = document.createElement("span");
    chapterE.className = "info-chapter bookmark-info";
    chapterE.appendChild(document.createTextNode(project["total_update"]));

    var viewE = document.createElement("span");
    viewE.className = "info-view bookmark-info";
    viewE.appendChild(document.createTextNode(project["view"]));

    var dateE = document.createElement("span");
    dateE.className = "info-date bookmark-info";
    dateE.appendChild(document.createTextNode(project["last_update"]));

    infoE.appendChild(nameE);
    infoE.appendChild(chapterE);
    infoE.appendChild(viewE);
    infoE.appendChild(dateE);

    itemCardE.appendChild(thumbE);
    itemCardE.appendChild(infoE);

    return {
        'time': stringToDate(project["last_update"]),
        'e': itemCardE
    }
}

function setBookmarkStatus() {
    if (isSetBookmark) {
        return;
    }
    var isUser = document.getElementById("profile-panel") != null;

    var bookmarkBtn = document.getElementsByClassName("bookmark-btn")[0];
    var bookmarkedBtn = document.getElementsByClassName("bookmarked-btn")[0];
    var bookmarkMsg = document.getElementById("please-login");
    var ratingBtn = document.getElementsByClassName("rating-overlay")[0];

    if (!isUser) {
        if (bookmarkedBtn != null && bookmarkedBtn != null) {
            bookmarkBtn.style.display = "none";
            bookmarkedBtn.style.display = "none";
            ratingBtn.style.display = "none";
            bookmarkMsg.style.display = "flex";
        }
        return;
    }

    if (bookmarkBtn != null) {
        var projectId = bookmarkBtn.id.replace(/[un]*book-project-/, "");
        var isBookmarked = checkIsBookmark(projectId);

        if (isBookmarked) {
            bookmarkBtn.style.display = "none";
            bookmarkedBtn.style.display = "block";
            bookmarkMsg.style.display = "none";

        } else {
            bookmarkedBtn.style.display = "none";
            bookmarkBtn.style.display = "block";
            bookmarkMsg.style.display = "none";

        }
    }
    isSetBookmark = true;
    loadProjectInfo();
}

function getBookmarkInfo() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function (ev) {
        if (this.status == 200 && this.readyState == 4) {
            if (this.responseText != null) {
                var doc = parserDOM.parseFromString(this.responseText, "application/xml");
                updateBookmarkInfo(doc);
                updateCheckoutInfo(doc);

                var temp = convertToItem();
                showBookmarkItem(temp);
                saveList();
            }
        }
    };
    xhr.overrideMimeType("application/xml");
    xhr.open("GET", "/api/bookmark");
    xhr.send();
}

function updateBookmarkInfo(doc) {
    getProjectObject(doc);

    var result = doc.evaluate("//bookmark/*[local-name()='project']/*[local-name()='id']", doc, null, XPathResult.ANY_TYPE, null);
    var thisBookmark = result.iterateNext();
    bookmarkList = [];
    while (thisBookmark) {
        var projectId = thisBookmark.textContent;
        bookmarkList.push(projectId);
        thisBookmark = result.iterateNext();
    }

    saveList();
}

function updateCheckoutInfo(node) {
    var result = node.evaluate("//bookmark/*[local-name()='checkout' and text()='true']/../*[local-name()='project']/*[local-name()='id']", node, null, XPathResult.ANY_TYPE, null);

    var thisCheckout = result.iterateNext();
    checkoutBookList = [];
    while (thisCheckout) {
        var projectId = thisCheckout.textContent;
        checkoutBookList.push(projectId);
        thisCheckout = result.iterateNext();
    }
}

function bookmarkIt(e, isUnbook) {
    var projectId = e.id.replace(/[un]*book-project-/, "");
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function (ev) {
        if (this.status == 200 && this.readyState == 4) {
            if (this.responseText != null) {
                var doc = parserDOM.parseFromString(this.responseText, "application/xml");
                getProjectObject(doc);
                updateBookmarkInfo(doc);
                updateCheckoutInfo(doc);

                saveList();
                window.location.reload();
                addNoti("Thao tác đã lưu", 1);
            }
        }
    };
    xhr.overrideMimeType("application/xml");
    if (isUnbook) {
        xhr.open("DELETE", "/api/unbookmark/" + projectId);
    } else {
        xhr.open("POST", "/api/bookmark/" + projectId);
    }
    xhr.send();
}

function checkIsBookmark(id) {
    for (var i = 0; i < bookmarkList.length; i++) {
        if (bookmarkList[i] === id) {
            return true;
        }
    }

    return false;
}

function saveList() {
    if (bookmarkList == null) {
        return;
    }
    var willSave = "";
    for (var i = 0; i < bookmarkList.length; i++) {
        if (willSave == "") {
            willSave = bookmarkList[i];
        } else {
            willSave = willSave + "," + bookmarkList[i];
        }
    }

    localStorage.setItem("ln3-bookmark", willSave);

    if (checkoutBookList == null) {
        return;
    }
    willSave = "";
    for (var i = 0; i < checkoutBookList.length; i++) {
        if (willSave == "") {
            willSave = checkoutBookList[i];
        } else {
            willSave = willSave + "," + checkoutBookList[i];
        }
    }

    localStorage.setItem("ln3-bookmark-checkout", willSave);
}

function getSavedList() {
    var saved = localStorage.getItem("ln3-bookmark");
    if (saved == null) {
        return [];
    } else {
        return saved.split(",");
    }
}

function getSavedCheckoutList() {
    var saved = localStorage.getItem("ln3-bookmark-checkout");
    if (saved == null) {
        return [];
    } else {
        return saved.split(",");
    }
}

function clearBookmarkSaved() {
    localStorage.removeItem("ln3-bookmark");
    localStorage.removeItem("ln3-bookmark-checkout");
}
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
function obj2XML(obj, name) {
    var xmlText = createStartTag(name);
    for (prop in obj) {
        xmlText += createStartTag(prop) + obj[prop] + createEndTag(prop);
    }
    xmlText += createEndTag(name);
    return xmlText;
}

function createEndTag(tagName) {
    return "</" + tagName + ">";
}

function createStartTag(tagName) {
    return "<" + tagName + ">";
}
changeTab = (tabEl, childId) => {
    removeClassFromClassGroup("focus","tab-button")
    tabEl.classList.add("focus")
    changeTabContent(childId)
}

changeTabContent = (childId) => {
    removeClassFromClassGroup("show","tab-content")
    var allTabContent = document.getElementsByClassName("tab-content")       
    allTabContent[childId].classList.add("show")
}

removeClassFromClassGroup = (kw, className) => {
    var allEl = document.getElementsByClassName(className)
    for (i = 0; i < allEl.length; i++) {
        let curEl = allEl[i]
        if (curEl.classList.contains(kw)) {
            curEl.classList.remove(kw)
        }
    }
}
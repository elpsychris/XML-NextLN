var projectPool = null;
var savedCache = null;

function findProjectObjectInChild(node, curProject, foundStartTag) {
    var isFound = false;
    var nodeName = node.nodeName.replace(/[a-zA-Z]+:/, "");

    if (nodeName == "genre") {
        return node.childNodes[0].textContent;
    }
    if (foundStartTag) {
        if (nodeName == "name" && projectPool != null) {
            if (projectPool[node.textContent] != null) {
                curProject = null;
                return false;
            }
        }
        if (nodeName == "genres") {
            curProject[nodeName] = "";
            if (node.childNodes[0] != null && node.childNodes[0].childNodes[0] == null) {
                curProject[nodeName] = node.textContent;
            } else {
                for (var i = 0; i < node.childNodes.length; i++) {
                    (function (ii) {
                        var genreObj = findProjectObjectInChild(node.childNodes[ii], curProject, true);
                        if (curProject[nodeName] != "") {
                            curProject[nodeName]+= "|" + genreObj;
                        } else {
                            curProject[nodeName] = genreObj;
                        }
                    }(i));
                }
            }
        } else {
            curProject[nodeName] = node.textContent;
        }
        if (nodeName == "link") {
            return curProject;
        }
        return true;
    } else if (nodeName == "project") {
        isFound = true;
    }

    var check = true;
    for (var i = 0; i < node.childNodes.length; i++) {
        (function (isFound, ii) {
                if (curProject["link"] == null && check) {
                    check = findProjectObjectInChild(node.childNodes[ii], curProject, isFound);
                }
            }(isFound, i)
        );
    }

    if (nodeName == "project") {
        return curProject;
    }
}

function getProjectObject(node) {
    var isFound = false;

    if (projectPool == null) {
        projectPool = {};
    }

    if (savedCache == null) {
        savedCache = localStorage.getItem("cacheProjects");
        if (savedCache != null) {
            var savedDoc = parserDOM.parseFromString(savedCache, "application/xml");
            getProjectObject(savedDoc);
        } else {
            savedCache = "";
        }
    }

    if (node == null) {
        return;
    }

    if (node.nodeName != "p:projects" && node.nodeName != "p:project") {
        for (var i = 0; i < node.childNodes.length; i++) {
            (function (ii) {
                    getProjectObject(node.childNodes[ii]);
                }(i)
            );
        }
        return;
    }

    if (node.nodeName == "p:projects") {
        for (var i = 0; i < node.childNodes.length; i++) {
            (function (isFound, ii) {
                    var sample = {};
                    var newProject = findProjectObjectInChild(node.childNodes[ii], sample, isFound);
                    if (newProject != null && newProject["name"] != null && projectPool[newProject["name"]] == null) {
                        projectPool[newProject["name"]] = newProject;
                    }
                }(isFound, i)
            );
        }
    } else {
        var sample = {};
        var newProject = findProjectObjectInChild(node, sample, isFound);
        if (newProject != null && newProject["name"] != null && projectPool[newProject["name"]] == null) {
            projectPool[newProject["name"]] = newProject;
        }
    }

    var xmlSerial = arr2XML(projectPool, "project", "http://t3.com/2018/project-page");
    localStorage.setItem("cacheProjects", xmlSerial);
}
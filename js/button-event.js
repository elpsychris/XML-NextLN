function onRunCrawler(e) {
    if (e.className == null) {
        e = e.target;
    }

    var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = onRunCrawlerRequestStateChange;

    if (e.className.indexOf("run") != -1) {
        xhttp.open("GET", "run", true);
        xhttp.send();
    }

    changeButtonSet(e);
}

function onRunCrawlerRequestStateChange() {
    if (this.readyState == 4 && this.status == 200) {
        console.log(this.responseText);
    }
}

function changeButtonSet(e) {
    if (e.className.indexOf("run") != -1) {
        var parent = e.parentElement;
        var newBtn = document.createElement("div");

        newBtn.className = "action-btn stop";
        newBtn.appendChild(document.createTextNode("Stop"));
        newBtn.addEventListener("click", onRunCrawler);

        e.className = "action-btn pause";
        e.childNodes[0].remove();
        e.appendChild(document.createTextNode("Pause"));

        parent.appendChild(newBtn);

    } else {
        var parent = e.parentElement;
        for (var i = 0; i < parent.children.length; i++) {
            if (parent.children[i] != e) {
                parent.children[i].remove();
            }
        }

        var btnRun = parent.children[0];
        btnRun.className = "action-btn run";
        btnRun.childNodes[0].remove();
        btnRun.appendChild(document.createTextNode("Run"));
    }
}
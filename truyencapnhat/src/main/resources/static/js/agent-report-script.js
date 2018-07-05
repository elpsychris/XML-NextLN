function refreshAgentState() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function (ev) {
        if (this.status == 200 && this.readyState == 4) {
            postMessage(this.responseText);
            setTimeout("refreshAgentState()", 500);
        }
    };

    xhttp.open("GET","/crawl/report", true);
    xhttp.overrideMimeType('application/xml');
    xhttp.send();
}

refreshAgentState();
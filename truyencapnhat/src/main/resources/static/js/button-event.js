function onRunCrawler(crawlerName) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = onRunCrawlerRequestStateChange;
    xhttp.open("GET", "/crawl/run/" + crawlerName, true);
    xhttp.send();
}

function onRunCrawlerRequestStateChange() {
    if (this.readyState == 4 && this.status == 200) {
        console.log(this.responseText);
    }
    
}
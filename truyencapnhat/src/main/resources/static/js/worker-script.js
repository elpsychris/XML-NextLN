var w;


window.onunload = onCrawlPageUnload;
startAgentUpdateReportWorker();

function onCrawlPageUnload() {
    if (w != undefined) {
        w.terminate();
    }
    w = undefined;
}

function startAgentUpdateReportWorker() {
    if (typeof(Worker) !== "undefined") {
        if (typeof(w) == "undefined") {
            w = new Worker("../js/agent-report-script.js");
        }

        w.onmessage = function(ev) {


            var parser = new DOMParser();
            var doc = parser.parseFromString(ev.data, "application/xml");
            var agents = doc.getElementsByTagName("p:agent");
            for (var i = 0; i < agents.length; i++) {
                agentName = agents[i].getElementsByTagName("p:name")[0].childNodes[0].textContent;
                agentState = agents[i].getElementsByTagName("p:status")[0].childNodes[0].textContent;
                agentUpdates = agents[i].getElementsByTagName("p:updates")[0].childNodes[0].textContent;
                agentInserts = agents[i].getElementsByTagName("p:inserts")[0].childNodes[0].textContent;

                var totalUpdates = document.getElementById("total-update-" + agentName);
                var totalInserts = document.getElementById("total-insert-" + agentName);

                totalUpdates.innerText = agentUpdates;
                totalInserts.innerText = agentInserts;

                var agentId = "crawler-config-" + agentName;
                var agentE = document.getElementById(agentId);
                var targetBtnSet = document.getElementById("btn-set-" + agentName);

                var status = "inactive";
                switch (agentState) {
                    case "0":
                        status = "paused";
                        break;
                    case "-1":
                        status = "stopping";
                        break;
                    case "1":
                        if (targetBtnSet != null) {
                            for (var i = 0; i < targetBtnSet.children.length; i++) {
                                var child = targetBtnSet.children[i];
                                if (child.classList.contains("run")) {
                                    changeButtonSet(child, agentName);
                                }
                            }
                        }
                        status = "running";
                }
                agentE.className = "crawler-config card-2 " + status;
            }
        };
    } else {
        console.log("Not support Web");
    }
}
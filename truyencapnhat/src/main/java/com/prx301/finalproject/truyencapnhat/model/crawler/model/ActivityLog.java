package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ActivityLog", propOrder = {
        "logList"
})
@XmlRootElement(name = "log")
public class ActivityLog {
    @XmlElementWrapper(name = "acts")
    @XmlElement(name = "act")
    private List<ProjectActivity> logList;

    public ActivityLog(){}

    public ActivityLog(List<ProjectActivity> logList) {
        this.logList = logList;
    }

    public List<ProjectActivity> getLogList() {
        return logList;
    }

    public void setLogList(List<ProjectActivity> logList) {
        this.logList = logList;
    }
}

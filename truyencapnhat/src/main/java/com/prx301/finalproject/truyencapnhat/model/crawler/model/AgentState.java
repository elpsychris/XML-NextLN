package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AgentState", propOrder = {
        "agentName",
        "status"
})
public class AgentState {
    @XmlElement(name = "name")
    private String agentName;
    @XmlElement(name = "status")
    private int status;

    public AgentState() {
    }

    public AgentState(String agentName, int status) {
        this.agentName = agentName;
        this.status = status;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}

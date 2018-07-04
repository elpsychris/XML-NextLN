package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import javax.xml.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AgentStateReport", propOrder = {
        "agentStates"
})
@XmlRootElement(name = "report")
public class AgentStateReport {
    @XmlElementWrapper(name = "agents")
    @XmlElement(name = "agent")
    private List<AgentState> agentStates = new ArrayList<>();

    public List<AgentState> getAgentStates() {
        return agentStates;
    }

    public void setAgentStates(List<AgentState> agentStates) {
        this.agentStates = agentStates;
    }

    public void addAgentReport(AgentState agentState) {
        agentStates.add(agentState);
    }
}

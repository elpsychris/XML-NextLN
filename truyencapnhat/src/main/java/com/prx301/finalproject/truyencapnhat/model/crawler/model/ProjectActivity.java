package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;

import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AgentState", propOrder = {
        "projectId",
        "rating"
})
public class ProjectActivity {
    @XmlElement(name = "id")
    private int projectId;
    @XmlElement(name = "rate")
    private int rating;
    @XmlTransient
    private double sim;

    public ProjectActivity(){}

    public ProjectActivity(int projectId, int rating) {
        this.projectId = projectId;
        this.rating = rating;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public double getSim() {
        return sim;
    }

    public void setSim(double sim) {
        this.sim = sim;
    }
}

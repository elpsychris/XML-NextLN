package com.prx301.finalproject.truyencapnhat.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlRootElement(name = "result")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "SearchProjects", propOrder = {
        "total",
        "projectEntities"
})
public class SearchProjects {
    @XmlElement(name = "total")
    private int total = 0;
    @XmlElementWrapper(name = "projects")
    @XmlElement(name = "project")
    private List<ProjectEntity> projectEntities;

    public SearchProjects() {

    }

    public SearchProjects(List<ProjectEntity> projectEntities) {
        this.projectEntities = projectEntities;
    }

    public SearchProjects(int total, List<ProjectEntity> projectEntities) {
        this.total = total;
        this.projectEntities = projectEntities;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<ProjectEntity> getProjectEntities() {
        return projectEntities;
    }

    public void setProjectEntities(List<ProjectEntity> projectEntities) {
        this.projectEntities = projectEntities;
    }
}

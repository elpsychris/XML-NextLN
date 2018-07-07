package com.prx301.finalproject.truyencapnhat.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlRootElement(name = "most-view")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MostViewProjects", propOrder = {
        "projectEntities"
})
public class MostViewProjects {
    @XmlElementWrapper(name = "projects")
    @XmlElement(name = "project")
    private List<ProjectEntity> projectEntities;

    public MostViewProjects() {

    }

    public MostViewProjects(List<ProjectEntity> projectEntities) {
        this.projectEntities = projectEntities;
    }

    public List<ProjectEntity> getProjectEntities() {
        return projectEntities;
    }

    public void setProjectEntities(List<ProjectEntity> projectEntities) {
        this.projectEntities = projectEntities;
    }
}

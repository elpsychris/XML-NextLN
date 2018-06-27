package com.prx301.finalproject.truyencapnhat.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlRootElement(name = "latest-update")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "LatestUpdates", propOrder = {
        "updateEntities"
})
public class LatestUpdates {
    @XmlElement(name = "updates")
    private List<UpdateEntity> updateEntities;

    public LatestUpdates() {

    }

    public LatestUpdates(List<UpdateEntity> updateEntities) {
        this.updateEntities = updateEntities;
    }

    public List<UpdateEntity> getUpdateEntities() {
        return updateEntities;
    }

    public void setUpdateEntities(List<UpdateEntity> updateEntities) {
        this.updateEntities = updateEntities;
    }
}

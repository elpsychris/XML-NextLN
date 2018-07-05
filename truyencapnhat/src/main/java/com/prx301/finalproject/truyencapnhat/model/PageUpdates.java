package com.prx301.finalproject.truyencapnhat.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlRootElement(name = "update-page")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PageUpdates", propOrder = {
        "total",
        "updateList"
})
public class PageUpdates {
    @XmlElement(name = "total")
    private int total = 0;
    @XmlElementWrapper(name = "updates")
    @XmlElement(name = "update")
    private List<UpdateEntity> updateList;

    public PageUpdates() {

    }

    public PageUpdates(List<UpdateEntity> updateEntities, int total) {
        this.updateList = updateEntities;
        this.total = total;
    }


    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }



    public List<UpdateEntity> getUpdateList() {
        return updateList;
    }

    public void setUpdateList(List<UpdateEntity> updateList) {
        this.updateList = updateList;
    }
}

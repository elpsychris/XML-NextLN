package com.prx301.finalproject.truyencapnhat.model;

import com.prx301.finalproject.truyencapnhat.utils.GroupAdapter;
import com.prx301.finalproject.truyencapnhat.utils.SqlTimeAdapter;
import com.prx301.finalproject.truyencapnhat.utils.UpdateNrmlAdapter;
import com.prx301.finalproject.truyencapnhat.utils.VolAdapter;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.sql.Timestamp;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "UpdateEntity", propOrder = {
        "updateId",
        "updateName",
        "updateVol",
        "updateDate",
        "updateGroup",
        "updateLink",
})
@Entity
@Table(name = "UpdateChap", schema = "dbo", catalog = "NU_DB")
@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(
                name = "get_updates",
                procedureName = "UpdateChap_GET_UPDATE",
                parameters = {
                        @StoredProcedureParameter(mode = ParameterMode.IN, name = "PageNumber", type = Integer.class),
                        @StoredProcedureParameter(mode = ParameterMode.IN, name = "PageSize", type = Integer.class),
                        @StoredProcedureParameter(mode = ParameterMode.IN, name = "ProjectID", type = Integer.class),
                        @StoredProcedureParameter(mode = ParameterMode.OUT, name = "Total", type = Integer.class)
                },
                resultClasses = UpdateEntity.class)
})
public class UpdateEntity {
    @XmlElement(name = "id")
    private int updateId;
    @XmlElement(name = "chapter-name")
    @XmlJavaTypeAdapter(UpdateNrmlAdapter.class)
    private String updateName;
    @XmlElement(name = "update-volume")
    @XmlJavaTypeAdapter(VolAdapter.class)
    private UpdateVolEntity updateVol;
    @XmlElement(name = "chapter-date")
    @XmlJavaTypeAdapter(SqlTimeAdapter.class)
    private Timestamp updateDate;
    @XmlElement(name = "update-group")
    @XmlJavaTypeAdapter(GroupAdapter.class)
    private GroupEntity updateGroup;
    @XmlElement(name = "update-link")
    private String updateLink;

    public UpdateEntity(){}

    public UpdateEntity(ProjectEntity projectEntity) {
        this.updateVol = new UpdateVolEntity(projectEntity);
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "update_id")
    public int getUpdateId() {
        return updateId;
    }

    public void setUpdateId(int updateId) {
        this.updateId = updateId;
    }

    @Basic
    @Column(name = "update_name")
    public String getUpdateName() {
        return updateName;
    }

    public void setUpdateName(String updateName) {
        this.updateName = updateName;
    }

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "update_vol")
    public UpdateVolEntity getUpdateVol() {
        return updateVol;
    }

    public void setUpdateVol(UpdateVolEntity updateVol) {
        this.updateVol = updateVol;
    }

    @Basic
    @Column(name = "update_date")
    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "update_group", nullable = false)
    public GroupEntity getUpdateGroup() {
        return updateGroup;
    }

    public void setUpdateGroup(GroupEntity updateGroup) {
        this.updateGroup = updateGroup;
    }

    @Basic
    @Column(name = "update_link")
    public String getUpdateLink() {
        return updateLink;
    }

    public void setUpdateLink(String updateLink) {
        this.updateLink = updateLink;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UpdateEntity that = (UpdateEntity) o;

        if (updateId != that.updateId) return false;
        if (updateName != null ? !updateName.equals(that.updateName) : that.updateName != null) return false;
        if (updateVol != null ? !updateVol.equals(that.updateVol) : that.updateVol != null) return false;
        if (updateDate != null ? !updateDate.equals(that.updateDate) : that.updateDate != null) return false;
        if (updateGroup != null ? !updateGroup.equals(that.updateGroup) : that.updateGroup != null) return false;
        if (updateLink != null ? !updateLink.equals(that.updateLink) : that.updateLink != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = 0;
        result = 31 * result + (updateName != null ? updateName.hashCode() : 0);
//        result = 31 * result + (updateVol != null ? updateVol.hashCode() : 0);
        result = 31 * result + (updateDate != null ? updateDate.hashCode() : 0);
        result = 31 * result + (updateGroup != null ? updateGroup.hashCode() : 0);
        result = 31 * result + (updateLink != null ? updateLink.hashCode() : 0);


        return result;
    }
}

package com.prx301.finalproject.truyencapnhat.model;

import com.prx301.finalproject.truyencapnhat.utils.VolNrmlAdapter;

import javax.persistence.*;
import javax.xml.bind.annotation.*;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "UpdateVol", schema = "dbo", catalog = "NU_DB")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "UpdateVolEntity", propOrder = {
        "id",
        "volName",
        "volNo",
        "volCover",
        "project",
        "updateEntities",
        "volHash"
})
public class UpdateVolEntity {
    private int id;
    @XmlJavaTypeAdapter(VolNrmlAdapter.class)
    @XmlElement(name = "volume-name")
    private String volName;
    private Integer volNo;
    @XmlElement(name = "volume-cover")
    private String volCover;
    @XmlElement(name = "project")
    private ProjectEntity project;
    @XmlElementWrapper(name = "updates")
    @XmlElement(name = "update")
    private List<UpdateEntity> updateEntities;
    @XmlElement(name = "vol-hash")
    private String volHash;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "vol_name")
    public String getVolName() {
        return volName;
    }

    public void setVolName(String volName) {
        this.volName = volName;
    }

    @Basic
    @Column(name = "vol_no")
    public Integer getVolNo() {
        return volNo;
    }

    public void setVolNo(Integer volNo) {
        this.volNo = volNo;
    }

    @Basic
    @Column(name = "vol_cover")
    public String getVolCover() {
        return volCover;
    }

    public void setVolCover(String volCover) {
        this.volCover = volCover;
    }

    @ManyToOne(cascade = {CascadeType.MERGE})
    @JoinColumn(name = "project_id")
    public ProjectEntity getProject() {
        return project;
    }

    public void setProject(ProjectEntity project) {
        this.project = project;
    }

    @OneToMany(mappedBy = "updateVol", cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    public List<UpdateEntity> getUpdateEntities() {
        return updateEntities;
    }

    public void setUpdateEntities(List<UpdateEntity> updateEntities) {
//        this.updateEntities = updateEntities;
    }

    @Basic
    @Column(name = "vol_hash")
    public String getVolHash() {
        return volHash;
    }

    public void setVolHash(String volHash) {
        this.volHash = volHash;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UpdateVolEntity that = (UpdateVolEntity) o;
        return id == that.id &&
                Objects.equals(volName, that.volName) &&
                Objects.equals(volNo, that.volNo) &&
                Objects.equals(volCover, that.volCover);
    }

    @Override
    public int hashCode() {
        int hash = Objects.hash(volName, volNo, volCover);
        if (updateEntities != null) {
            hash += updateEntities.hashCode();
        }

        this.volHash = hash + "";
        return hash;
    }
}

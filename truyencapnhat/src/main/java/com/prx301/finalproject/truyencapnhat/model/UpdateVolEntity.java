package com.prx301.finalproject.truyencapnhat.model;

import com.prx301.finalproject.truyencapnhat.utils.VolNrmlAdapter;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
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
        "updateEntities"
})
public class UpdateVolEntity {
    private int id;
    @XmlJavaTypeAdapter(VolNrmlAdapter.class)
    @XmlElement(name = "volume-name")
    private String volName;
    private Integer volNo;
    @XmlElement(name = "volume-cover")
    private String volCover;
    private List<UpdateEntity> updateEntities;

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

    @OneToMany(mappedBy = "updateVol", cascade = CascadeType.MERGE)
    public List<UpdateEntity> getUpdateEntities() {
        return updateEntities;
    }

    public void setUpdateEntities(List<UpdateEntity> updateEntities) {
//        this.updateEntities = updateEntities;
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

        return Objects.hash(id, volName, volNo, volCover);
    }
}

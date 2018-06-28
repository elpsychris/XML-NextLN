package com.prx301.finalproject.truyencapnhat.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "UpdateVol", schema = "dbo", catalog = "NU_DB")
public class UpdateVolEntity {
    private int id;
    private String volName;
    private Integer volNo;
    private String volCover;

    @Id
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

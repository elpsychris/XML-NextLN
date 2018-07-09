package com.prx301.finalproject.truyencapnhat.model;


import com.prx301.finalproject.truyencapnhat.utils.LowerCaseAdapter;

import javax.persistence.*;
import javax.xml.bind.annotation.*;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GenreEntity", propOrder = {
        "genreId",
        "genreName",
        "projects"
})
@Table(name = "Genre", schema = "dbo", catalog = "NU_DB")
public class GenreEntity {
    @XmlJavaTypeAdapter(LowerCaseAdapter.class)
    @XmlElement(name = "genre-id")
    private String genreId;
    private String genreName;

    private List<ProjectEntity> projects = new ArrayList<>();

    @XmlTransient
    private List<ProjectEntity> temp = new ArrayList<>();

    @Id
    @Column(name = "genre_id")
    public String getGenreId() {
        return genreId;
    }

    public void setGenreId(String genreId) {
        this.genreId = genreId;
    }

    @Column(name = "genre")
    public String getGenreName() {
        return genreName;
    }

    public void setGenreName(String genreName) {
        this.genreName = genreName;
    }

    @ManyToMany(mappedBy = "genres", fetch = FetchType.EAGER)
    public List<ProjectEntity> getProjects() {
        return projects;
    }

    public void setProjects(List<ProjectEntity> projects) {
//        this.projects = projects;
        this.temp = projects;
    }

    @Transient
    public List<ProjectEntity> getTemp() {
        return temp;
    }

    public void setTemp(List<ProjectEntity> temp) {
        this.temp = temp;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GenreEntity that = (GenreEntity) o;
        return Objects.equals(genreId, that.genreId) &&
                Objects.equals(genreName, that.genreName) &&
                Objects.equals(projects, that.projects);
    }

    @Override
    public int hashCode() {
        return Objects.hash(genreName);
    }
}

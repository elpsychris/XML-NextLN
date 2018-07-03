package com.prx301.finalproject.truyencapnhat.model;

import com.prx301.finalproject.truyencapnhat.utils.*;

import javax.persistence.*;
import javax.xml.bind.annotation.*;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ProjectEntity", propOrder = {
        "projectId",
        "projectName",
        "projectAlterName",
        "projectPublishDate",
        "projectAuthor",
        "projectIllustrator",
        "projectSynopsis",
        "projectHash",
        "projectTag",
        "projectView",
        "projectPoint",
        "genres",
        "updateVols",
        "projectLastUpdate",
        "projectTotalUpdate",
        "projectLink"
})
@Entity
@Table(name = "Project", schema = "dbo", catalog = "NU_DB")
public class ProjectEntity {
    @XmlElement(name = "id")
    private int projectId;
    @XmlElement(required = true, name = "name")
    @XmlJavaTypeAdapter(NameAdapter.class)
    private String projectName;
    @XmlElement(required = true, name = "alter-name")
    private String projectAlterName;
    @XmlJavaTypeAdapter(PublishDateAdapter.class)
    @XmlElement(name = "publish-date")
    private Date projectPublishDate;
    @XmlElement(name = "author")
    private String projectAuthor;
    @XmlElement(name = "illustrator")
    private String projectIllustrator;
    @XmlElement(name = "synopsis")
    private String projectSynopsis;
    @XmlElement(name = "hash")
    private String projectHash;
    @XmlElement(name = "tag")
    private String projectTag;
    @XmlJavaTypeAdapter(ViewAdapter.class)
    @XmlElement(name = "view")
    private Integer projectView;
    @XmlJavaTypeAdapter(PointAdapter.class)
    @XmlElement(name = "point")
    private Double projectPoint = 5.0;

    @XmlElementWrapper(name = "genres")
    @XmlElement(name = "genre")
    @XmlJavaTypeAdapter(GenreAdapter.class)
    private Set<GenreEntity> genres = new HashSet<>();

    @XmlElementWrapper(name = "volumes")
    @XmlElement(name = "volume")
    private List<UpdateVolEntity> updateVols;

    @XmlJavaTypeAdapter(SqlDateAdapter.class)
    @XmlElement(name = "last_update")
    private Date projectLastUpdate;
    @XmlElement(name = "total_update")
    private Integer projectTotalUpdate;
    @XmlElement(name = "link")
    private String projectLink;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "project_id")
    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Basic
    @Column(name = "project_name")
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    @Basic
    @Column(name = "project_alter_name")
    public String getProjectAlterName() {
        return projectAlterName;
    }

    public void setProjectAlterName(String projectAlterName) {
        this.projectAlterName = projectAlterName;
    }

    @Basic
    @Column(name = "project_publish_date")
    public Date getProjectPublishDate() {
        return projectPublishDate;
    }

    public void setProjectPublishDate(Date projectPublishDate) {
        this.projectPublishDate = projectPublishDate;
    }

    @Basic
    @Column(name = "project_author")
    public String getProjectAuthor() {
        return projectAuthor;
    }

    public void setProjectAuthor(String projectAuthor) {
        this.projectAuthor = projectAuthor;
    }

    @Basic
    @Column(name = "project_illustrator")
    public String getProjectIllustrator() {
        return projectIllustrator;
    }

    public void setProjectIllustrator(String projectIllustrator) {
        this.projectIllustrator = projectIllustrator;
    }

    @Basic
    @Column(name = "project_synopsis")
    public String getProjectSynopsis() {
        return projectSynopsis;
    }

    public void setProjectSynopsis(String projectSynopsis) {
        this.projectSynopsis = projectSynopsis;
    }

    @Basic
    @Column(name = "project_hash")
    public String getProjectHash() {
        return projectHash;
    }

    public void setProjectHash(String projectHash) {
        this.projectHash = projectHash;
    }

    @Basic
    @Column(name = "project_tag")
    public String getProjectTag() {
        return projectTag;
    }

    public void setProjectTag(String projectTag) {
        this.projectTag = projectTag;
    }

    @Basic
    @Column(name = "project_view")
    public Integer getProjectView() {
        return projectView;
    }

    public void setProjectView(Integer projectView) {
        this.projectView = projectView;
    }

    @Column(name = "project_point")
    public Double getProjectPoint() {
        return projectPoint;
    }

    public void setProjectPoint(Double projectPoint) {
        this.projectPoint = projectPoint;
    }

    @Basic
    @Column(name = "project_last_update")
    public Date getProjectLastUpdate() {
        return projectLastUpdate;
    }

    public void setProjectLastUpdate(Date projectLastUpdate) {
        this.projectLastUpdate = projectLastUpdate;
    }

    @Basic
    @Column(name = "project_total_update")
    public Integer getProjectTotalUpdate() {
        return projectTotalUpdate;
    }

    public void setProjectTotalUpdate(Integer projectTotalUpdate) {
        this.projectTotalUpdate = projectTotalUpdate;
    }

    @ManyToMany(cascade = {CascadeType.MERGE}, targetEntity = GenreEntity.class, fetch = FetchType.EAGER)
    @JoinTable(
            name = "GenreMap",
            joinColumns = {@JoinColumn(name = "project_id")},
            inverseJoinColumns = {@JoinColumn(name = "genre_id")}
    )
    public Set<GenreEntity> getGenres() {
        return genres;
    }

    public void setGenres(Set<GenreEntity> genres) {
        this.genres = genres;
    }

    @OneToMany(cascade = {CascadeType.ALL}, mappedBy = "project", fetch = FetchType.EAGER)
    public List<UpdateVolEntity> getUpdateVols() {
        return updateVols;
    }

    public void setUpdateVols(List<UpdateVolEntity> updateVols) {
//        this.updateVols = updateVols;
    }

    @Basic
    @Column(name = "project_link")
    public String getProjectLink() {
        return projectLink;
    }

    public void setProjectLink(String projectLink) {
        this.projectLink = projectLink;
    }

    public void clearUpdateVols() {
        this.updateVols = null;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProjectEntity that = (ProjectEntity) o;

        if (projectId != that.projectId) return false;
        if (projectName != null ? !projectName.equals(that.projectName) : that.projectName != null) return false;
        if (projectAlterName != null ? !projectAlterName.equals(that.projectAlterName) : that.projectAlterName != null)
            return false;
        if (projectPublishDate != null ? !projectPublishDate.equals(that.projectPublishDate) : that.projectPublishDate != null)
            return false;
        if (projectAuthor != null ? !projectAuthor.equals(that.projectAuthor) : that.projectAuthor != null)
            return false;
        if (projectIllustrator != null ? !projectIllustrator.equals(that.projectIllustrator) : that.projectIllustrator != null)
            return false;
        if (projectSynopsis != null ? !projectSynopsis.equals(that.projectSynopsis) : that.projectSynopsis != null)
            return false;
        if (projectHash != null ? !projectHash.equals(that.projectHash) : that.projectHash != null) return false;
        if (projectTag != null ? !projectTag.equals(that.projectTag) : that.projectTag != null) return false;
        if (projectView != null ? !projectView.equals(that.projectView) : that.projectView != null) return false;
        if (projectPoint != null ? !projectPoint.equals(that.projectPoint) : that.projectPoint != null) return false;
        if (projectLastUpdate != null ? !projectLastUpdate.equals(that.projectLastUpdate) : that.projectLastUpdate != null)
            return false;
        if (projectTotalUpdate != null ? !projectTotalUpdate.equals(that.projectTotalUpdate) : that.projectTotalUpdate != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = 0;
        result = 31 * result + (projectName != null ? projectName.hashCode() : 0);
        result = 31 * result + (projectAlterName != null ? projectAlterName.hashCode() : 0);
        result = 31 * result + (projectPublishDate != null ? projectPublishDate.hashCode() : 0);
        result = 31 * result + (projectAuthor != null ? projectAuthor.hashCode() : 0);
        result = 31 * result + (projectIllustrator != null ? projectIllustrator.hashCode() : 0);
        result = 31 * result + (projectSynopsis != null ? projectSynopsis.hashCode() : 0);
        result = 31 * result + (updateVols != null ? updateVols.hashCode() : 0);
//        result = 31 * result + (projectHash != null ? projectHash.hashCode() : 0);
        result = 31 * result + (projectTag != null ? projectTag.hashCode() : 0);
        result = 31 * result + (projectView != null ? projectView.hashCode() : 0);
        result = 31 * result + (projectPoint != null ? projectPoint.hashCode() : 0);
//        result = 31 * result + (projectLastUpdate != null ? projectLastUpdate.hashCode() : 0);
//        result = 31 * result + (projectTotalUpdate != null ? projectTotalUpdate.hashCode() : 0);
        return result;
    }
}

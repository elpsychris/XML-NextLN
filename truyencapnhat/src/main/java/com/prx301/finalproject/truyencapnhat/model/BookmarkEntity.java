package com.prx301.finalproject.truyencapnhat.model;

import com.prx301.finalproject.truyencapnhat.utils.SqlTimeStampAdapter;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "Bookmark", schema = "dbo", catalog = "NU_DB")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BookmarkEntity", propOrder = {
        "id",
        "projectEntity",
        "accountEntity",
        "isCheckout",
        "lastCheck"
})
public class BookmarkEntity {
    @XmlElement(name = "id")
    private int id;
    @XmlElement(name = "project")
    private ProjectEntity projectEntity;
    private AccountEntity accountEntity;

    @XmlElement(name = "checkout")
    private boolean isCheckout = false;

    @XmlJavaTypeAdapter(SqlTimeStampAdapter.class)
    @XmlElement(name = "last_check")
    private Timestamp lastCheck;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne(cascade = {CascadeType.MERGE})
    @JoinColumn(name = "project_id")
    public ProjectEntity getProjectEntity() {
        return projectEntity;
    }

    public void setProjectEntity(ProjectEntity projectEntity) {
        this.projectEntity = projectEntity;
    }

    @ManyToOne(cascade = {CascadeType.MERGE})
    @JoinColumn(name = "account_id")
    public AccountEntity getAccountEntity() {
        return accountEntity;
    }

    public void setAccountEntity(AccountEntity accountEntity) {
        this.accountEntity = accountEntity;
    }

    @Basic
    @Column(name = "last_check")
    public Timestamp getLastCheck() {
        return lastCheck;
    }

    public void setLastCheck(Timestamp lastCheck) {
        this.lastCheck = lastCheck;
    }

    @Transient
    public boolean isCheckout() {
        return isCheckout;
    }

    public void setCheckout(boolean checkout) {
        isCheckout = checkout;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BookmarkEntity that = (BookmarkEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id);
    }
}

package com.prx301.finalproject.truyencapnhat.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "Bookmark", schema = "dbo", catalog = "NU_DB")
public class BookmarkEntity {
    private int id;
    private ProjectEntity projectEntity;
    private AccountEntity accountEntity;

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

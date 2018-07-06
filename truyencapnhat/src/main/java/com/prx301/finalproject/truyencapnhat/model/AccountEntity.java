package com.prx301.finalproject.truyencapnhat.model;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "Account", schema = "dbo", catalog = "NU_DB")
public class AccountEntity  {
    private String username;
    private String password;
    private Boolean isAdmin = false;
    private List<BookmarkEntity> bookmarkEntityList;

    @Id
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "isAdmin")
    public Boolean getAdmin() {
        return isAdmin;
    }

    public void setAdmin(Boolean admin) {
        isAdmin = admin;
    }

    @OneToMany(cascade = CascadeType.MERGE, mappedBy = "projectEntity")
    public List<BookmarkEntity> getBookmarkEntityList() {
        return bookmarkEntityList;
    }

    public void setBookmarkEntityList(List<BookmarkEntity> bookmarkEntityList) {
        this.bookmarkEntityList = bookmarkEntityList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AccountEntity that = (AccountEntity) o;
        return Objects.equals(username, that.username) &&
                Objects.equals(password, that.password) &&
                Objects.equals(isAdmin, that.isAdmin);
    }

    @Override
    public int hashCode() {

        return Objects.hash(username, password, isAdmin);
    }
}

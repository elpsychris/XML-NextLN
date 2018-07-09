package com.prx301.finalproject.truyencapnhat.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.xml.bind.annotation.*;
import java.util.List;
import java.util.Objects;

@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "Account", schema = "dbo", catalog = "NU_DB")
@XmlType(name = "AccountEntity", propOrder = {
        "username",
        "password",
        "isAdmin",
        "bookmarkEntityList"
})
@XmlRootElement(name = "account")
public class AccountEntity  {
    @XmlElement(name = "username")
    private String username;
    @XmlElement(name = "password")
    private String password;
    private Boolean isAdmin = false;
    private List<BookmarkEntity> bookmarkEntityList;

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
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

    @OneToMany(cascade = CascadeType.MERGE, mappedBy = "accountEntity")
    public List<BookmarkEntity> getBookmarkEntityList() {
        return bookmarkEntityList;
    }

    public void setBookmarkEntityList(List<BookmarkEntity> bookmarkEntityList) {
//        this.bookmarkEntityList = bookmarkEntityList;
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

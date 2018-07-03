package com.prx301.finalproject.truyencapnhat.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "User", schema = "dbo", catalog = "NU_DB")
public class UserEntity {
    private String username;
    private String password;
    private Boolean isAdmin;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserEntity that = (UserEntity) o;
        return Objects.equals(username, that.username) &&
                Objects.equals(password, that.password) &&
                Objects.equals(isAdmin, that.isAdmin);
    }

    @Override
    public int hashCode() {

        return Objects.hash(username, password, isAdmin);
    }
}

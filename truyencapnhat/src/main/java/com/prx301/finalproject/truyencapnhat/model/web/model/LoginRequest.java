package com.prx301.finalproject.truyencapnhat.model.web.model;

import javax.xml.bind.annotation.*;
import java.util.Calendar;
import java.util.Objects;

@XmlType(name = "LoginRequest", propOrder = {
        "username",
        "password",
        "isAdmin",
        "time"
})
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "login-request")
public class LoginRequest {
    @XmlElement(name = "username")
    private String username;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "is-admin")
    private boolean isAdmin = false;
    private long time = Calendar.getInstance().getTime().getTime();

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LoginRequest that = (LoginRequest) o;
        return isAdmin == that.isAdmin &&
                Objects.equals(username, that.username) &&
                Objects.equals(password, that.password);
    }

    @Override
    public int hashCode() {

        return Objects.hash(username, password, isAdmin, time);
    }
}

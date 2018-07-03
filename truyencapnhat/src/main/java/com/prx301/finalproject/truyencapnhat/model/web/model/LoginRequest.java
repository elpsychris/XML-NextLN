package com.prx301.finalproject.truyencapnhat.model.web.model;

import javax.xml.bind.annotation.*;

@XmlType(name = "AuthTicket", propOrder = {
        "username",
        "password",
        "token",
        "isAdmin",
        "stateCode"
})
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "ticket")
public class AuthTicket {
    @XmlElement(name = "username")
    private String username;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "token")
    private String token;
    @XmlElement(name = "is-admin")
    private int isAdmin;
    @XmlElement(name = "state-code")
    private int stateCode;

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

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getStateCode() {
        return stateCode;
    }

    public void setStateCode(int stateCode) {
        this.password = null;
        this.username = null;
        this.stateCode = stateCode;
    }
}

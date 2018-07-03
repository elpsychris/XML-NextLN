package com.prx301.finalproject.truyencapnhat.model.web.model;


import com.prx301.finalproject.truyencapnhat.utils.ComUtils;

import javax.xml.bind.annotation.*;
import java.util.Calendar;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AuthTicket", propOrder = {
        "token"
})
@XmlRootElement(name = "ticket")
public class AuthTicket {
    @XmlElement(name = "token")
    private String token = null;

    public AuthTicket() {

    }

    public AuthTicket(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

//    public long getTime() {
//        return time;
//    }
//
//    public void setTime(long time) {
//        this.time = time;
//    }
}

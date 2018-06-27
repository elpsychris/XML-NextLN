package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ConfigComp", propOrder = {
        "name",
        "stylesheet",
        "config",
        "status"
})
public class ConfigComp {
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "stylesheet")
    private String stylesheet;
    @XmlElement(name = "config")
    private String config;
    @XmlElement(name = "status")
    private String status;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStylesheet() {
        return stylesheet;
    }

    public void setStylesheet(String stylesheet) {
        this.stylesheet = stylesheet;
    }

    public String getConfig() {
        return config;
    }

    public void setConfig(String config) {
        this.config = config;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

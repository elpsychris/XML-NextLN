package com.prx301.finalproject.truyencapnhat.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ConfigComp", propOrder = {
        "stylesheet",
        "config",
})
public class ConfigComp {
    @XmlElement(name = "stylesheet")
    private String stylesheet;
    @XmlElement(name = "config")
    private String config;

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
}
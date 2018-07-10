package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ConfigComp", propOrder = {
        "name",
        "stylesheet",
        "config",
        "uriResolverClassName",
        "cleanFilter",
        "status",
        "schemaUri"
})
public class ConfigComp {
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "stylesheet")
    private String stylesheet;
    @XmlElement(name = "config")
    private String config;
    @XmlElement(name = "uri-resolver")
    private String uriResolverClassName;
    @XmlElementWrapper(name = "clean-filters")
    @XmlElement(name = "filter")
    private List<CleanFilter> cleanFilter;
    @XmlElement(name = "status")
    private int status;
    @XmlElement(name = "schema")
    private String schemaUri;

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

    public String getUriResolverClassName() {
        return uriResolverClassName;
    }

    public void setUriResolverClassName(String uriResolverClassName) {
        this.uriResolverClassName = uriResolverClassName;
    }

    public List<CleanFilter> getCleanFilter() {
        return cleanFilter;
    }

    public void setCleanFilter(List<CleanFilter> cleanFilter) {
        this.cleanFilter = cleanFilter;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getSchemaUri() {
        return schemaUri;
    }

    public void setSchemaUri(String schemaUri) {
        this.schemaUri = schemaUri;
    }
}

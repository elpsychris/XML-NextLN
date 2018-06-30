package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CleanFilter", propOrder = {
        "pageUri",
        "filterPatterns"
})
public class CleanFilter {
    @XmlElement(name = "page-uri")
    private String pageUri;
    @XmlElementWrapper(name = "filter-patterns")
    @XmlElement(name = "pattern")
    private List<String> filterPatterns;

    public String getPageUri() {
        return pageUri;
    }

    public void setPageUri(String pageUri) {
        this.pageUri = pageUri;
    }

    public List<String> getFilterPatterns() {
        return filterPatterns;
    }

    public void setFilterPatterns(List<String> filterPatterns) {
        this.filterPatterns = filterPatterns;
    }
}

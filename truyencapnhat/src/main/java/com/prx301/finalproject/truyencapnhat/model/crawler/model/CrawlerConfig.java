package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlAccessorType(value = XmlAccessType.FIELD)
@XmlType(name = "CrawlerConfig", propOrder = {
        "configComps"
})
@XmlRootElement(name = "crawler-config")
public class CrawlerConfig {
    @XmlElementWrapper(name = "components")
    @XmlElement(name = "component")
    private List<ConfigComp> configComps = null;

    public List<ConfigComp> getConfigComps() {
        return configComps;
    }

    public void setConfigComps(List<ConfigComp> configComps) {
        this.configComps = configComps;
    }
}

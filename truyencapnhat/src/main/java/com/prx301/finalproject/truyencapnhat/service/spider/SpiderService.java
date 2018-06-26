package com.prx301.finalproject.truyencapnhat.service.spider;


import com.prx301.finalproject.truyencapnhat.model.*;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import com.prx301.finalproject.truyencapnhat.utils.ComUtils;
import com.prx301.finalproject.truyencapnhat.utils.JAXBUtils;
import com.prx301.finalproject.truyencapnhat.utils.Logger;
import com.prx301.finalproject.truyencapnhat.utils.TrAXUtils;
import org.apache.commons.jxpath.JXPathContext;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.xml.sax.SAXException;

import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Service
public class SpiderService {
    private final String DEFAULT_PARENT_PATH = "src/main/java/com/prx301/finalproject/truyencapnhat";
    private ProjectRepo projectRepo = null;
    private Logger logger = Logger.getLogger();
    private Map<String, ConfigComp> configMap = null;

//    public Spider() {
//    }
//
//    public Spider(ProjectRepo projectRepo, Logger logger) {
//        this.projectRepo = projectRepo;
//        this.logger = logger;
//    }


    public SpiderService(ProjectRepo projectRepo) {
        this.projectRepo = projectRepo;
        this.logger = Logger.getLogger();

        // Read website for crawling from XML config gile
        config();
    }

    private void config() {
        CrawlerConfig crawlerConfig = ComUtils.getCrawlerConfig();

        this.configMap = new HashMap<>();
        // JXPath to read CrawlerConfig
        JXPathContext context = JXPathContext.newContext(crawlerConfig);
        String exp = "//component[@status='active']";
        Iterator iterator = context.iterate(exp);
        while (iterator.hasNext()) {
            ConfigComp configComp = (ConfigComp) iterator.next();
            this.configMap.put(configComp.getName(), configComp);
        }
    }

    public void startCrawling() {
        for (Map.Entry entry : this.configMap.entrySet()) {
            ConfigComp configComp = (ConfigComp) entry.getValue();
            CrawlerAgent crawlerAgent = new CrawlerAgent(configComp, projectRepo);
            new Thread(crawlerAgent).start();
        }
    }


}

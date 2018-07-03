package com.prx301.finalproject.truyencapnhat.service.spider;


import com.prx301.finalproject.truyencapnhat.model.crawler.model.ConfigComp;
import com.prx301.finalproject.truyencapnhat.model.crawler.model.CrawlerAgent;
import com.prx301.finalproject.truyencapnhat.model.crawler.model.CrawlerConfig;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import com.prx301.finalproject.truyencapnhat.repository.UpdateRepo;
import com.prx301.finalproject.truyencapnhat.repository.VolRepo;
import com.prx301.finalproject.truyencapnhat.utils.*;
import org.apache.commons.jxpath.JXPathContext;
import org.springframework.stereotype.Service;

import javax.xml.bind.JAXBException;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Service
public class SpiderService {
    private final String DEFAULT_PARENT_PATH = "src/main/java/com/prx301/finalproject/truyencapnhat";
    private ProjectRepo projectRepo = null;
    private UpdateRepo updateRepo = null;
    private VolRepo volRepo = null;

    private Logger logger = Logger.getLogger();
    private Map<String, ConfigComp> configMap = null;

//    public Spider() {
//    }
//
//    public Spider(ProjectRepo projectRepo, Logger logger) {
//        this.projectRepo = projectRepo;
//        this.logger = logger;
//    }


    public SpiderService(ProjectRepo projectRepo, UpdateRepo updateRepo, VolRepo volRepo) {
        this.projectRepo = projectRepo;
        this.updateRepo = updateRepo;
        this.volRepo = volRepo;
    }

    private void config() {
        CrawlerConfig crawlerConfig = ComUtils.getCrawlerConfig();

        this.configMap = new HashMap<>();
        // JXPath to read CrawlerConfig
        JXPathContext context = JXPathContext.newContext(crawlerConfig);
        String exp = "//*[status='active']";
        Iterator iterator = context.iterate(exp);
        while (iterator.hasNext()) {
            ConfigComp configComp = (ConfigComp) iterator.next();
            this.configMap.put(configComp.getName(), configComp);
        }
    }

    public String getXslConfigMenu() {
        return ComUtils.getStreamFromFile("xml_config.xsl");
    }

    public String getConfigMenu() {
        StringWriter writer = new StringWriter();
        StreamResult streamResult = new StreamResult(writer);

        try {
            JAXBUtils.objectToXML(ComUtils.getCrawlerConfig(), streamResult);
        } catch (JAXBException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, "Cannot parse Crawler XML config file", e, SpiderService.class);
        }

        return writer.toString();
    }

    public void startCrawling() {
        // Read website for crawling from XML config gile
        config();

        for (Map.Entry entry : this.configMap.entrySet()) {
            ConfigComp configComp = (ConfigComp) entry.getValue();
            CrawlerAgent crawlerAgent = new CrawlerAgent(configComp, projectRepo, updateRepo, volRepo);
            new Thread(crawlerAgent).start();
        }
    }




}

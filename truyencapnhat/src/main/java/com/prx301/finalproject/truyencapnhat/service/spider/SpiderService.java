package com.prx301.finalproject.truyencapnhat.service.spider;


import com.prx301.finalproject.truyencapnhat.model.crawler.model.*;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import com.prx301.finalproject.truyencapnhat.repository.UpdateRepo;
import com.prx301.finalproject.truyencapnhat.repository.VolRepo;
import com.prx301.finalproject.truyencapnhat.utils.ComUtils;
import com.prx301.finalproject.truyencapnhat.utils.JAXBUtils;
import com.prx301.finalproject.truyencapnhat.utils.Logger;
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
    private final static String EXIST_AGENT_RUNNING = "Bộ Crawler đang chạy";
    private final static String NO_AGENT_FOUND = "Không tìm thấy bộ Crawler cần tìm";
    private final static String AGENT_ALREADY_STOPPED = "Crawler không còn chạy";

    private ProjectRepo projectRepo = null;
    private UpdateRepo updateRepo = null;
    private VolRepo volRepo = null;

    private Logger logger = Logger.getLogger();
    private Map<String, ConfigComp> configMap = new HashMap<>();
    private Map<String, CrawlerAgent> runningCrawler = new HashMap<>();

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
        config();
    }

    private void config() {
        CrawlerConfig crawlerConfig = ComUtils.getCrawlerConfig();

        for (ConfigComp configComp : crawlerConfig.getConfigComps()) {
            configMap.put(configComp.getName(), configComp);
        }


        // JXPath to read CrawlerConfig
//        JXPathContext context = JXPathContext.newContext(crawlerConfig);
//        String exp = "//*[status='active']";
//        Iterator iterator = context.iterate(exp);
//        while (iterator.hasNext()) {
//            ConfigComp configComp = (ConfigComp) iterator.next();
//            this.configMap.put(configComp.getName(), configComp);
//        }
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

    public String stopCrawling(String name) {
        ConfigComp configComp = configMap.get(name);
        CrawlerAgent runningAgent = runningCrawler.get(name);
        if (configComp == null) {
            return NO_AGENT_FOUND;
        } else {
            if (runningAgent == null) {
                return AGENT_ALREADY_STOPPED;
            }
            runningAgent.stop();
            return "";
        }
    }

    public String startCrawling(String name) {
        // Read website for crawling from XML config gile
        ConfigComp configComp = configMap.get(name);
        CrawlerAgent runningAgent = runningCrawler.get(name);
        if (configComp == null) {
            return NO_AGENT_FOUND;
        } else {
            if (runningAgent != null) {
                return EXIST_AGENT_RUNNING;
            }

            CrawlerAgent crawlerAgent = new CrawlerAgent(configComp, projectRepo, updateRepo, volRepo);
            this.runningCrawler.put(configComp.getName(), crawlerAgent);
            new Thread(crawlerAgent).start();
            return "";
        }
    }

    public String getStateReport() {
        AgentStateReport agentStateReport = new AgentStateReport();
        for (Map.Entry<String, CrawlerAgent> agent : runningCrawler.entrySet()) {
            CrawlerAgent crawlerAgent = agent.getValue();
            agentStateReport.addAgentReport(new AgentState(agent.getKey(), crawlerAgent.getAgentStatus()));
        }

        StringWriter stringWriter = new StringWriter();
        StreamResult streamResult = new StreamResult(stringWriter);
        try {
            JAXBUtils.objectToXML(agentStateReport, streamResult);
        } catch (JAXBException e) {
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, e, SpiderService.class);
        }
        return stringWriter.toString();
    }

}

package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.Projects;
import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import com.prx301.finalproject.truyencapnhat.utils.*;
import org.xml.sax.SAXException;

import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class CrawlerAgent implements Runnable {
    private ConfigComp configComponent = null;
    private Logger logger = Logger.getLogger();
    private DOMResult result = null;
    private MyURIResolver uriResolver = null;
    private ProjectRepo projectRepo = null;

    public CrawlerAgent(ConfigComp config, ProjectRepo projectRepo) {
        this.configComponent = config;
        this.projectRepo = projectRepo;
    }

    @Override
    public void run() {
        if (configComponent != null) {
            configCrawler();
            start(configComponent.getConfig(), configComponent.getStylesheet());
        }
    }


    private void start(String configPath, String xslPath) {
        try {
            this.result = this.crawl(configPath, xslPath);
        } catch (TransformerException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, SpiderService.class);
        } catch (IOException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, SpiderService.class);
        } catch (InterruptedException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, SpiderService.class);
        }

        try {
            Schema schema = JAXBUtils.getSchema("src/main/java/com/prx301/finalproject/truyencapnhat/schema/project_page.xsd");
            Projects projects = JAXBUtils.<Projects>xmlToObject(this.result, schema, Projects.class);
            for (ProjectEntity project : projects.getProjects()) {
                project.setProjectHash(project.hashCode() + "");
                for (UpdateEntity updateEntity : project.getUpdates()) {
                    updateEntity.setProject(project);
                }
                projectRepo.save(project);
            }

        } catch (SAXException e) {
            logger.log(Logger.LOG_LEVEL.WARNING, "SAXException", e, ComUtils.class);
        } catch (JAXBException e) {
//            e.printStackTrace();
            logger.log(Logger.LOG_LEVEL.ERROR, e, SpiderService.class);
        }
    }


    private void configCrawler() {
        if (this.configComponent.getUriResolverClassName() != null) {
            try {
                this.uriResolver = (MyURIResolver) Class.forName(this.configComponent.getUriResolverClassName()).newInstance();
                this.uriResolver.config(this.configComponent);
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            this.uriResolver = new MyURIResolver();
            this.uriResolver.config(this.configComponent);
        }
    }

    private DOMResult crawl(String configPath, String xslPath) throws TransformerException, IOException, InterruptedException {
        StreamSource xsl = new StreamSource(xslPath);
        InputStream is = new FileInputStream(configPath);
        StreamSource config = new StreamSource(is);

        return TrAXUtils.transform(config, xsl, uriResolver);
    }

    public void stop() {
        if (this.uriResolver == null) {
            logger.info("No attached URIResolver", CrawlerAgent.class);
            return;
        }
        this.uriResolver.stop();
    }

}

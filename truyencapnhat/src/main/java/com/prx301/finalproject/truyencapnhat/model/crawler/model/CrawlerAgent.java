package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.Projects;
import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateVolEntity;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import com.prx301.finalproject.truyencapnhat.repository.UpdateRepo;
import com.prx301.finalproject.truyencapnhat.repository.VolRepo;
import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import com.prx301.finalproject.truyencapnhat.utils.*;
import org.xml.sax.SAXException;

import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import java.io.*;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

public class CrawlerAgent implements Runnable {
    private ConfigComp configComponent = null;
    private Logger logger = Logger.getLogger();
    private DOMResult result = null;
    private MyURIResolver uriResolver = null;
    private String curXmlConfig = null;

    private UpdateRepo updateRepo = null;
    private ProjectRepo projectRepo = null;
    private VolRepo volRepo = null;

    public CrawlerAgent(ConfigComp config, ProjectRepo projectRepo, UpdateRepo updateRepo, VolRepo volRepo) {
        this.configComponent = config;
        this.projectRepo = projectRepo;
        this.updateRepo = updateRepo;
        this.volRepo = volRepo;
    }

    @Override
    public void run() {
        if (configComponent != null) {
            configCrawler();
            start(configComponent.getConfig(), configComponent.getStylesheet());
        }
    }

    private void start(String configPath, String xslPath) {
        start(configPath, xslPath, null);
    }

    private void start(String configPath, String xslPath, String newUrl) {
        try {
            this.result = this.crawl(configPath, xslPath, newUrl);
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
            List<ProjectEntity> projectEntityList = projectRepo.findAll();
            // Check and save project
            for (ProjectEntity project : projects.getProjects()) {
                System.out.println("Start process " + project.getProjectName());

                if (project.getUpdateVols() != null) {
                    for (UpdateVolEntity updateVol : project.getUpdateVols()) {
                        updateVol.setProject(project);

                        if (updateVol.getUpdateEntities() != null) {
                            for (UpdateEntity updateEntity : updateVol.getUpdateEntities()) {
                                updateEntity.setUpdateVol(updateVol);
                            }
                        }
                    }
                }

                // Make new hash for new project
                project.setProjectHash(project.hashCode() + "");
                // Check if there is a project with same name
                ProjectEntity existProject = projectRepo.findByProjectName(project.getProjectName());
                // If not, check a project with identical name
                if (existProject == null) {
                    existProject = ComUtils.findIdenticalExist(project, projectEntityList);
                    if (existProject != null) {
                        System.out.printf("Found an identical: %s | %s\n", project.getProjectName(), existProject.getProjectName());
                    }
                }
                // If there is a project with same name or identical name, then compare hash
                if (existProject != null) {
                    // If two hash codes are not the same
                    if (!existProject.getProjectHash().equals(project.getProjectHash())) {
                        try {
                            // Prepare for merge info of the project
                            List<UpdateVolEntity> newVolUpdates = project.getUpdateVols();
                            project.clearUpdateVols();

                            // Move current project name to new project's altername
                            String curAlter = project.getProjectAlterName() == null ? "" : project.getProjectAlterName();
                            if (!curAlter.toLowerCase().contains(project.getProjectName().toLowerCase())) {
                                curAlter = curAlter + project.getProjectName();
                            }
                            // Remove old project name and hash for preparing to merge
                            project.setProjectName(null);
                            project.setProjectHash(null);
                            project.setProjectAlterName(curAlter);
                            // Join two genre sets
                            existProject.getGenres().addAll(project.getGenres());

                            existProject = ComUtils.mergeObject(existProject, project);
                            existProject.hashCode();
                            int countTotal = 0;
                            int countExist = 0;

                            if (existProject.getUpdateVols() != null) {
                                for (UpdateVolEntity newVolUpdate : newVolUpdates) {
                                    countTotal++;
                                    boolean isExist = false;
                                    for (UpdateVolEntity existVol : existProject.getUpdateVols()) {
                                        if (existVol.getVolHash().equals(newVolUpdate.getVolHash())) {
                                            isExist = true;
                                            break;
                                        }
                                    }

                                    if (!isExist) {
                                        newVolUpdate.setProject(existProject);
                                        volRepo.save(newVolUpdate);
                                        System.out.println("\t\t\tAdd update: " + newVolUpdate.getVolName());
                                    }
                                    if (isExist) {
                                        countExist++;
                                    }
                                }
                            }
                            if (countTotal > countExist) {
                                System.out.printf("\t%s Total: %d, Exist: %d\n", existProject.getProjectName(), countTotal, countExist);
                            }
                        } catch (IllegalAccessException e) {
                            logger.log(Logger.LOG_LEVEL.ERROR, "Cannot access object", e, CrawlerAgent.class);
                            e.printStackTrace();
                        }
                        existProject.hashCode();
                        existProject.setProjectLastUpdate(new Date(Calendar.getInstance().getTime().getTime()));
                        projectRepo.save(existProject);
                    }
                } else {
                    System.out.println("\tSave new project: " + (project.getUpdateVols()  == null ? 0 : project.getUpdateVols().size() + " (updates)"));
                    project.setProjectLastUpdate(new Date(Calendar.getInstance().getTime().getTime()));
                    projectRepo.save(project);
                    projectEntityList.add(project);
                }

            }

            if (projects.getNextList() != null) {
                start(configPath, xslPath, projects.getNextList());
            }

        } catch (SAXException e) {
            logger.log(Logger.LOG_LEVEL.WARNING, "SAXException", e, ComUtils.class);
        } catch (JAXBException e) {
//            e.printStackTrace();
            e.printStackTrace();
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

    private DOMResult crawl(String configPath, String xslPath, String newUrl) throws TransformerException, IOException, InterruptedException {
        StreamSource xsl = new StreamSource(xslPath);
        StreamSource config = null;
        if (this.curXmlConfig == null) {
            this.curXmlConfig = readXMLConfig(configPath);
        }

        if (newUrl != null) {
            this.curXmlConfig = replaceUrl(newUrl, this.curXmlConfig);
        }
        config = new StreamSource(new ByteArrayInputStream(this.curXmlConfig.getBytes()));

        return TrAXUtils.transform(config, xsl, uriResolver);
    }

    private String replaceUrl(String newUrl, String oldXmlConfig) {
        String newLinkAttr = String.format("link=\"%s\"", newUrl);
        return oldXmlConfig.replaceAll("link=\"[^\n]+\"", newLinkAttr);
    }

    private String readXMLConfig(String configPath) throws IOException {
        StringBuilder builder = new StringBuilder();
        InputStream is = null;
        InputStreamReader streamReader = null;
        BufferedReader bufferedReader = null;
        try {
            is = new FileInputStream(configPath);
            streamReader = new InputStreamReader(is);
            bufferedReader = new BufferedReader(streamReader);
            String line = null;
            while ((line = bufferedReader.readLine()) != null) {
                builder.append(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (bufferedReader != null) {
                bufferedReader.close();
            }

            if (streamReader != null) {
                streamReader.close();
            }

            if (is != null) {
                is.close();
            }
        }
        return builder.toString();
    }

    public void stop() {
        if (this.uriResolver == null) {
            logger.info("No attached URIResolver", CrawlerAgent.class);
            return;
        }
        this.uriResolver.stop();
    }

}

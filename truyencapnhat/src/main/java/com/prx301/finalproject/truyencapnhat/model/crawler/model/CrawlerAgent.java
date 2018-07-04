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
import java.sql.Timestamp;
import java.util.ArrayList;
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
                Logger.getLogger().info("Start process " + project.getProjectName(), CrawlerAgent.class);

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
                        Logger.getLogger().info(String.format("Found an identical: %s | %s\n", project.getProjectName(), existProject.getProjectName()), CrawlerAgent.class);
                    }
                }
                // If there is a project with same name or identical name, then compare hash
                if (existProject != null) {
                    boolean isUpdate = false;
                    // If two hash codes are not the same
                    if (!existProject.getProjectHash().equals(project.getProjectHash())) {
                        try {
                            // Prepare for merge info of the project
                            List<UpdateVolEntity> newVolUpdates = project.getUpdateVols();
                            project.clearUpdateVols();

                            // Move current project name to new project's altername
                            String curAlter = project.getProjectAlterName() == null ? "" : project.getProjectAlterName();
                            if (!curAlter.toLowerCase().contains(project.getProjectName().toLowerCase())) {
                                curAlter = curAlter + ";" + project.getProjectName();
                            }
                            // Remove old project name and hash for preparing to merge
                            project.setProjectName(null);
                            project.setProjectHash(null);
                            project.setProjectAlterName(curAlter);
                            // Join two genre sets
                            existProject.getGenres().addAll(project.getGenres());

                            existProject = ComUtils.mergeObject(existProject, project);
                            existProject.hashCode();

                            List<UpdateVolEntity> existUpdateVol = volRepo.findByProject(existProject);

                            if (existUpdateVol != null) {
                                for (UpdateVolEntity newVolUpdate : newVolUpdates) {
                                    boolean isExist = false;
                                    for (UpdateVolEntity existVol : existUpdateVol) {
                                        if (existVol.getVolHash().equals(newVolUpdate.getVolHash())) {
                                            isExist = true;
                                            break;
                                        }
                                    }

                                    if (!isExist && newVolUpdate.getUpdateEntities() != null) {
                                        UpdateVolEntity sameNameVol = null;
                                        List<UpdateVolEntity> tVol = volRepo.findByProjectAndVolName(existProject, newVolUpdate.getVolName());
                                        if (tVol != null && tVol.size() > 0) {
                                            sameNameVol = tVol.get(0);
                                        }
                                        if (sameNameVol != null) {
                                            List<UpdateEntity> sameNameUpdateList = updateRepo.getByUpdateVol(sameNameVol);
                                            for (UpdateEntity newUpdate : newVolUpdate.getUpdateEntities()) {
                                                boolean isUpdateExist = false;
                                                if (sameNameUpdateList == null) {
                                                    sameNameUpdateList = new ArrayList<>();
                                                }
                                                for (UpdateEntity sameNameUpdate : sameNameUpdateList) {
                                                    if (sameNameUpdate.hashCode() == newUpdate.hashCode()) {
                                                        isUpdateExist = true;
                                                        break;
                                                    } else if (sameNameUpdate.getUpdateName().equals(newUpdate.getUpdateName())
                                                            && sameNameUpdate.getUpdateLink().equals(newUpdate.getUpdateLink())) {
                                                        isUpdateExist = true;
                                                        sameNameUpdate.setUpdateDate(newUpdate.getUpdateDate());
                                                        sameNameUpdate.setUpdateGroup(newUpdate.getUpdateGroup());
                                                        sameNameUpdate.hashCode();
                                                        updateRepo.save(sameNameUpdate);
                                                        Logger.getLogger().info("\t\t\t\tUpdate an update: " + sameNameUpdate.getUpdateName(), CrawlerAgent.class);
                                                        break;
                                                    }
                                                }

                                                if (!isUpdateExist) {
                                                    isUpdate = true;

                                                    newUpdate.setUpdateVol(sameNameVol);
                                                    updateRepo.save(newUpdate);
                                                    Logger.getLogger().info("\t\t\t\tAdd new update: " + newUpdate.getUpdateName(), CrawlerAgent.class);

                                                    ProjectEntity projectEntity = sameNameVol.getProject();
                                                    projectEntity.setProjectTotalUpdate(projectEntity.getProjectTotalUpdate() + 1);
                                                    projectRepo.save(projectEntity);
                                                }
                                            }
                                        } else {
                                            isUpdate = true;
                                            newVolUpdate.setProject(existProject);
                                            volRepo.save(newVolUpdate);
                                            Logger.getLogger().info("\t\t\tAdd new vol: " + newVolUpdate.getVolName(), CrawlerAgent.class);

                                            int newTotal = 0;
                                            if (newVolUpdate.getUpdateEntities() != null) {
                                                newTotal = newVolUpdate.getUpdateEntities().size();
                                            }
                                            existProject.setProjectTotalUpdate(existProject.getProjectTotalUpdate() + newTotal);
                                            Logger.getLogger().info("\t\t\tTotal new updates: " + newTotal, CrawlerAgent.class);
                                            projectRepo.save(existProject);
                                        }
                                    }
                                }
                            }
                        } catch (IllegalAccessException e) {
                            logger.log(Logger.LOG_LEVEL.ERROR, "Cannot access object", e, CrawlerAgent.class);
                        }
                        existProject.hashCode();
                        if (isUpdate) {
                            existProject.setProjectLastUpdate(new Timestamp(Calendar.getInstance().getTime().getTime()));
                        }
                        projectRepo.save(existProject);
                    }
                } else {
                    project.setProjectTotalUpdate(project.countUpdate());
                    projectRepo.save(project);
                    projectEntityList.add(project);
                    Logger.getLogger().info("\tSave new project: " + project.getProjectTotalUpdate() + " (updates)", CrawlerAgent.class);
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

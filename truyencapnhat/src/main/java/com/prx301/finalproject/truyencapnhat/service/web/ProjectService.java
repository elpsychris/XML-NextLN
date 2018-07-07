package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.MostViewProjects;
import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.SearchProjects;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import com.prx301.finalproject.truyencapnhat.utils.JAXBUtils;
import com.prx301.finalproject.truyencapnhat.utils.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.xml.bind.JAXBException;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;
import java.util.List;

@Service
public class ProjectService {
    private ProjectRepo projectRepo;

    @Autowired
    private EntityManager em;

    private final int DEFAULT_PAGE_SIZE = 20;

    public ProjectService(ProjectRepo projectRepo) {
        this.projectRepo = projectRepo;
    }

    public List<ProjectEntity> getAllProjects() {
        return projectRepo.findAll();
    }

    public ProjectEntity getProjectById(int id) {
        return projectRepo.findByProjectId(id);
    }


    public MostViewProjects getMostViewProjectEntities(int pageNo) {
        PageRequest pageRequest = PageRequest.of(pageNo, 5, Sort.by(Sort.Order.desc("projectView")));
        List<ProjectEntity> mostViewList = projectRepo.findAll(pageRequest).getContent();
        return new MostViewProjects(mostViewList);
    }

    public String getMostViewByXML() {
        List<ProjectEntity> projectEntities = projectRepo.findTop5ByOrderByProjectViewDesc();
        MostViewProjects mostViewProjects = new MostViewProjects(projectEntities);

        StringWriter stringWriter = new StringWriter();
        StreamResult streamResult = new StreamResult(stringWriter);

        try {
            JAXBUtils.objectToXML(mostViewProjects, streamResult);
        } catch (JAXBException e) {
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, e, ProjectService.class);
        }
        return stringWriter.toString();
    }

    public SearchProjects searchProjectLikeName(String name) {
        List<ProjectEntity> projectEntities = projectRepo.findByProjectNameIgnoreCaseContaining(name);
        SearchProjects searchProjects = new SearchProjects(projectEntities);

        return searchProjects;
    }

    public SearchProjects searchProjectLikeName(String keyword, int pageNo) {
        StoredProcedureQuery searchQuery = em.createNamedStoredProcedureQuery("search_projects");

        searchQuery.setParameter("PageNumber", pageNo);
        searchQuery.setParameter("PageSize", DEFAULT_PAGE_SIZE);
        searchQuery.setParameter("Keyword", keyword);
        List<ProjectEntity> resultList = searchQuery.getResultList();
        int total = (int) searchQuery.getOutputParameterValue("Total");

        return new SearchProjects(total, resultList);
    }

}

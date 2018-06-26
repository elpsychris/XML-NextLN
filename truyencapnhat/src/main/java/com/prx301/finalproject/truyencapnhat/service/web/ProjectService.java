package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {
    private ProjectRepo projectRepository;

    public ProjectService(ProjectRepo projectRepository) {
        this.projectRepository = projectRepository;
    }

    public List<ProjectEntity> getAllProjects() {
        return projectRepository.findAll();
    }

    public ProjectEntity getProjectById(int id) {
        return projectRepository.findByProjectId(id);
    }
}

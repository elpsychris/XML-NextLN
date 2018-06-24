package com.prx301.finalproject.truyencapnhat.service;

import com.prx301.finalproject.truyencapnhat.model.Project;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {
    private ProjectRepository projectRepository;

    public ProjectService(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }
}

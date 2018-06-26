package com.prx301.finalproject.truyencapnhat.repository;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepo extends JpaRepository<ProjectEntity, Integer> {
    List<ProjectEntity> findAll();
    ProjectEntity findByProjectId(int id);
}

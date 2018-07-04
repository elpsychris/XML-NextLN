package com.prx301.finalproject.truyencapnhat.repository;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateVolEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VolRepo extends JpaRepository<UpdateVolEntity, Integer> {
    UpdateVolEntity findByVolName(String volName);

    List<UpdateVolEntity> findByProject(ProjectEntity projectEntity);

    List<UpdateVolEntity> findByProjectAndVolName(ProjectEntity projectEntity, String volname);

//    List<UpdateVolEntity> findByProject(int projectId);
}

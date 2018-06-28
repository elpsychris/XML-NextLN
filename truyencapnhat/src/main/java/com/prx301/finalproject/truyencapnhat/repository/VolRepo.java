package com.prx301.finalproject.truyencapnhat.repository;

import com.prx301.finalproject.truyencapnhat.model.UpdateVolEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VolRepo extends JpaRepository<UpdateVolEntity, Integer> {
    UpdateVolEntity findByVolName(String volName);
}

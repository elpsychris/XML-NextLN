package com.prx301.finalproject.truyencapnhat.repository;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateVolEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UpdateRepo extends JpaRepository<UpdateEntity, Integer>, PagingAndSortingRepository<UpdateEntity, Integer> {
    List<UpdateEntity> getTop5ByOrderByUpdateDateDesc();
    List<UpdateEntity> getByUpdateVol(UpdateVolEntity updateVolEntity);


//    @Procedure(name = "latest_updates")
//    List<UpdateEntity> getUpdatePage(@Param("PageNumber") int pageNo, @Param("PageSize") int pageSize);
}

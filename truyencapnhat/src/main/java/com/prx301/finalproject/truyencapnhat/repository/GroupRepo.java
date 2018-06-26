package com.prx301.finalproject.truyencapnhat.repository;

import com.prx301.finalproject.truyencapnhat.model.GenreEntity;
import com.prx301.finalproject.truyencapnhat.model.GroupEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GroupRepo extends JpaRepository<GroupEntity, String> {
    public GroupEntity findFirstByGroupId(String groupId);
}

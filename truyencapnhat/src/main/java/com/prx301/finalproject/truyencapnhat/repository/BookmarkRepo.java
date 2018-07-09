package com.prx301.finalproject.truyencapnhat.repository;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import com.prx301.finalproject.truyencapnhat.model.BookmarkEntity;
import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookmarkRepo extends JpaRepository<BookmarkEntity, Integer> {
    public List<BookmarkEntity> getByAccountEntity(AccountEntity accountEntity);
    public BookmarkEntity getByAccountEntityAndProjectEntity(AccountEntity accountEntity, ProjectEntity projectEntity);
}

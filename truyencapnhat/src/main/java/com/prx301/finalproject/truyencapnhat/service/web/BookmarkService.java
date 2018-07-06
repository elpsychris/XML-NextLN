package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import com.prx301.finalproject.truyencapnhat.model.BookmarkEntity;
import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.repository.BookmarkRepo;
import org.springframework.stereotype.Service;

@Service
public class BookmarkService {
    private BookmarkRepo bookmarkRepo;
    private AccountService accountService;
    private ProjectService projectService;

    public BookmarkService(BookmarkRepo bookmarkRepo, AccountService accountService, ProjectService projectService) {
        this.bookmarkRepo = bookmarkRepo;
        this.accountService = accountService;
        this.projectService = projectService;
    }

    public boolean bookmarkProject(String token, int projectId) {
        ProjectEntity projectEntity = projectService.getProjectById(projectId);
        AccountEntity accountEntity = accountService.getAccount(token);
        if (projectEntity != null && accountEntity != null) {
            BookmarkEntity bookmarkEntity = new BookmarkEntity();
            bookmarkEntity.setAccountEntity(accountEntity);
            bookmarkEntity.setProjectEntity(projectEntity);

            bookmarkRepo.save(bookmarkEntity);
            return true;
        }
        return false;
    }
}

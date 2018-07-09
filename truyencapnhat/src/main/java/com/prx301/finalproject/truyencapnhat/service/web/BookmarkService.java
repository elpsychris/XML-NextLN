package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import com.prx301.finalproject.truyencapnhat.model.BookmarkEntity;
import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.web.model.BookmarkList;
import com.prx301.finalproject.truyencapnhat.repository.BookmarkRepo;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

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

    public BookmarkList getBookmarkList(String token) {
        AccountEntity accountEntity = accountService.getAccount(token);
        if (accountEntity != null) {
            List<BookmarkEntity> result = bookmarkRepo.getByAccountEntity(accountEntity);
            for (BookmarkEntity bookmarkEntity : result) {
                ProjectEntity project = bookmarkEntity.getProjectEntity();
                if (project.getProjectLastUpdate().compareTo(bookmarkEntity.getLastCheck()) < 0) {
                    bookmarkEntity.setCheckout(true);
                }
            }
            return new BookmarkList(result);
        }
        return null;
    }

    public BookmarkList bookmarkProject(String token, int projectId) {
        ProjectEntity projectEntity = projectService.getProjectById(projectId);
        AccountEntity accountEntity = accountService.getAccount(token);

        if (bookmarkRepo.getByAccountEntityAndProjectEntity(accountEntity, projectEntity) == null
                && projectEntity != null && accountEntity != null) {
            BookmarkEntity bookmarkEntity = new BookmarkEntity();
            bookmarkEntity.setAccountEntity(accountEntity);
            bookmarkEntity.setProjectEntity(projectEntity);
            bookmarkEntity.setLastCheck(new Timestamp(Calendar.getInstance().getTime().getTime()));

            bookmarkRepo.save(bookmarkEntity);
        }

        return getBookmarkList(token);
    }

    public BookmarkList unbookmarkProject(String token, int projectId) {
        ProjectEntity projectEntity = projectService.getProjectById(projectId);
        AccountEntity accountEntity = accountService.getAccount(token);

        BookmarkEntity bookmarkEntity = bookmarkRepo.getByAccountEntityAndProjectEntity(accountEntity, projectEntity);
        if ( bookmarkEntity != null
                && projectEntity != null && accountEntity != null) {
            bookmarkRepo.delete(bookmarkEntity);
        }

        return getBookmarkList(token);
    }

    public BookmarkList checkoutBookmark(String token, int projectId) {
        ProjectEntity projectEntity = projectService.getProjectById(projectId);
        AccountEntity accountEntity = accountService.getAccount(token);

        BookmarkEntity bookmarkEntity = bookmarkRepo.getByAccountEntityAndProjectEntity(accountEntity, projectEntity);
        bookmarkEntity.setLastCheck(new Timestamp(Calendar.getInstance().getTime().getTime()));
        if ( bookmarkEntity != null
                && projectEntity != null && accountEntity != null) {
            bookmarkRepo.save(bookmarkEntity);
        }

        return getBookmarkList(token);
    }
}

package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.*;
import com.prx301.finalproject.truyencapnhat.model.web.model.AuthTicket;
import com.prx301.finalproject.truyencapnhat.model.web.model.LoginRequest;
import com.prx301.finalproject.truyencapnhat.service.web.AccountService;
import com.prx301.finalproject.truyencapnhat.service.web.BookmarkService;
import com.prx301.finalproject.truyencapnhat.service.web.ProjectService;
import com.prx301.finalproject.truyencapnhat.service.web.UpdateService;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class APIController {
    private AccountService accountService = null;
    private UpdateService updateService = null;
    private ProjectService projectService = null;
    private BookmarkService bookmarkService = null;

    public APIController(AccountService accountService, UpdateService updateService, BookmarkService bookmarkService, ProjectService projectService) {
        this.accountService = accountService;
        this.updateService = updateService;
        this.bookmarkService = bookmarkService;
        this.projectService = projectService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_XML_VALUE, produces = MediaType.APPLICATION_XML_VALUE)
    public AuthTicket login(HttpSession session, @RequestBody LoginRequest loginRequest) {
        return accountService.checkLogin(loginRequest, session);
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST, consumes = MediaType.APPLICATION_XML_VALUE)
    public boolean signup(@RequestBody AccountEntity signupReq) {
        return accountService.signupAccount(signupReq);
    }

    @RequestMapping(value = "/logout/{tokenId}", method = RequestMethod.GET)
    public void logout(HttpSession session, @PathVariable("tokenId") String token, ModelMap modelMap) {
        if (token == null || token.isEmpty()) {
            token = (String) session.getAttribute(AccountService.TOKEN_KEY);
        }
        AuthTicket authTicket = new AuthTicket(token);
        accountService.logout(authTicket);
    }

    @RequestMapping(value = "/updates/{project-id}/{page-no}", produces = MediaType.APPLICATION_XML_VALUE)
    public PageUpdates getUpdateByProject(@PathVariable("project-id") int projectId, @PathVariable("page-no") int pageNo) {
        return updateService.getPageUpdate(pageNo, projectId);
    }

    @RequestMapping(value = "/updates/latest/{page-no}", method = RequestMethod.GET, produces = MediaType.APPLICATION_XML_VALUE)
    public LatestUpdates getLatestUpdate(@PathVariable("page-no") int pageNo) {
        return updateService.getLatestUpdateEntities(pageNo);
    }

    @RequestMapping(value = "/projects/mostview/{page-no}", method = RequestMethod.GET, produces = MediaType.APPLICATION_XML_VALUE)
    public MostViewProjects getMostView(@PathVariable("page-no") int pageNo) {
        return projectService.getMostViewProjectEntities(pageNo);
    }

    @RequestMapping(value = "/projects/search/{keyword}", method = RequestMethod.GET, produces = MediaType.APPLICATION_XML_VALUE)
    public SearchProjects getMostView(@PathVariable("keyword") String keyword) {
        return projectService.searchProjectLikeName(keyword);
    }

    @RequestMapping(value = "/projects/search/{keyword}/{page-no}", method = RequestMethod.GET, produces = MediaType.APPLICATION_XML_VALUE)
    public SearchProjects getMostView(@PathVariable("keyword") String keyword, @PathVariable("page-no") int pageNo) {
        return projectService.searchProjectLikeName(keyword, pageNo);
    }

    @RequestMapping(value = "/bookmark/{project-id}", method = RequestMethod.POST)
    public boolean bookmarkProject(@PathVariable("project-id") int projectId, HttpSession session) {
        String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
        AuthTicket authTicket = new AuthTicket(token);

        int result = accountService.checkRole(authTicket);
        if (result == AccountService.LOGIN_AS_USER) {
            return bookmarkService.bookmarkProject(token, projectId);
        }
        return false;
    }
}

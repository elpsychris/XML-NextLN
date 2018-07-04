package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.web.model.AuthTicket;
import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import com.prx301.finalproject.truyencapnhat.repository.GroupRepo;
import com.prx301.finalproject.truyencapnhat.repository.VolRepo;
import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import com.prx301.finalproject.truyencapnhat.service.web.AccountService;
import com.prx301.finalproject.truyencapnhat.utils.AdapterHelper;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/crawl")
public class CrawlerActionController {

    private SpiderService spiderService;
    private AccountService accountService;

    public CrawlerActionController(SpiderService spiderService, AccountService accountService) {
        this.spiderService = spiderService;
        this.accountService = accountService;
    }

    @GetMapping(value = "/run/{crawlerName}")
    public String runCrawler(@PathVariable("crawlerName") String crawlerName, HttpSession session) {
        boolean isAuth = false;
        if (session != null) {
            String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
            AuthTicket ticket = new AuthTicket(token);
            isAuth = accountService.checkRole(ticket) == AccountService.LOGIN_AS_ADMIN;
        }

        if (!isAuth) {
            return "Permission denied";
        }

        return spiderService.startCrawling(crawlerName);
    }

    @GetMapping(value = "/stop/{crawlerName}")
    public String stopCrawler(@PathVariable("crawlerName") String crawlerName, HttpSession session) {
        boolean isAuth = false;
        if (session != null) {
            String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
            AuthTicket ticket = new AuthTicket(token);
            isAuth = accountService.checkRole(ticket) == AccountService.LOGIN_AS_ADMIN;
        }

        if (!isAuth) {
            return "Permission denied";
        }

        return spiderService.stopCrawling(crawlerName);
    }

    @GetMapping(value = "/report")
    public String getCrawlerReport(HttpSession session) {
        boolean isAuth = false;
        if (session != null) {
            String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
            AuthTicket ticket = new AuthTicket(token);
            isAuth = accountService.checkRole(ticket) == AccountService.LOGIN_AS_ADMIN;
        }

        if (!isAuth) {
            return "Permission denied";
        }

        return spiderService.getStateReport();
    }
}

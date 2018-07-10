package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.web.model.AuthTicket;
import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import com.prx301.finalproject.truyencapnhat.repository.GroupRepo;
import com.prx301.finalproject.truyencapnhat.repository.VolRepo;
import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import com.prx301.finalproject.truyencapnhat.service.web.AccountService;
import com.prx301.finalproject.truyencapnhat.utils.AdapterHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpStatusCodeException;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/crawler")
public class CrawlerController {
    private SpiderService spiderService;
    private GenreRepo genreRepo;
    private GroupRepo groupRepo;
    private VolRepo volRepo;
    private AccountService accountService;

    public CrawlerController(SpiderService spiderService, AccountService accountService, GenreRepo genreRepo, GroupRepo groupRepo, VolRepo volRepo) {
        this.spiderService = spiderService;
        this.genreRepo = genreRepo;
        this.groupRepo = groupRepo;
        this.volRepo = volRepo;
        this.accountService = accountService;

        AdapterHelper.groupRepo = groupRepo;
        AdapterHelper.genreRepo = genreRepo;
        AdapterHelper.volRepo = volRepo;
    }

    @GetMapping("/")
    public String index(ModelMap modelMap, HttpSession session) {
        boolean isAuth = false;
        if (session != null) {
            String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
            isAuth = accountService.checkRole(token) == AccountService.LOGIN_AS_ADMIN;
        }

        if (!isAuth) {
            return "error401";
        }
        String configXml = spiderService.getConfigMenu();
        String configXsl = spiderService.getXslConfigMenu();
        modelMap.addAttribute("configXml", configXml);
        modelMap.addAttribute("configXsl", configXsl);
        return "crawl";
    }

//    @GetMapping("/stop")
//    public HttpResponse stopCrawling() {
//
//    }
}

package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import com.prx301.finalproject.truyencapnhat.repository.GroupRepo;
import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import com.prx301.finalproject.truyencapnhat.utils.AdapterHelper;
import com.sun.deploy.net.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/crawler")
public class CrawlerController {
    private SpiderService spiderService;
    private GenreRepo genreRepo;
    private GroupRepo groupRepo;

    public CrawlerController(SpiderService spiderService, GenreRepo genreRepo, GroupRepo groupRepo) {
        this.spiderService = spiderService;
        this.genreRepo = genreRepo;
        this.groupRepo = groupRepo;
        AdapterHelper.groupRepo = groupRepo;
        AdapterHelper.genreRepo = genreRepo;
    }

    @GetMapping("/crawl")
    public String runCrawl() {
        spiderService.startCrawling();
        return "crawl";
    }

//    @GetMapping("/stop")
//    public HttpResponse stopCrawling() {
//
//    }
}

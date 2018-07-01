package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import com.prx301.finalproject.truyencapnhat.repository.GroupRepo;
import com.prx301.finalproject.truyencapnhat.repository.VolRepo;
import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import com.prx301.finalproject.truyencapnhat.utils.AdapterHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/crawl")
public class CrawlerActionController {

    private SpiderService spiderService;

    public CrawlerActionController(SpiderService spiderService) {
        this.spiderService = spiderService;
    }

    @GetMapping(value = "/run", produces = "application/xml")
    public @ResponseBody String runCrawler() {
        spiderService.startCrawling();
        return spiderService.getConfigMenu();
    }
}

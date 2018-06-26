package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/crawler")
public class CrawlerController {
    private SpiderService spiderService;

    public CrawlerController(SpiderService spiderService) {
        this.spiderService = spiderService;
    }

    @GetMapping("/crawl")
    public String runCrawl() {
        spiderService.startCrawling();
        return "crawl";
    }
}

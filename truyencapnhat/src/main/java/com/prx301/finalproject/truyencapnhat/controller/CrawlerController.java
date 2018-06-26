package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import com.prx301.finalproject.truyencapnhat.spider.Spider;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/crawler")
public class CrawlerController {
    private SpiderService spiderService;

    public CrawlerController(SpiderService spiderService) {
        this.spiderService = spiderService;
    }

    @GetMapping("/crawl")
    public String runCrawl() {
        spiderService.start("src/main/java/com/prx301/finalproject/truyencapnhat/xmlConfigs/hako_project.xml","src/main/java/com/prx301/finalproject/truyencapnhat/stylesheet/hako_style.xsl");
        return "crawl";
    }
}

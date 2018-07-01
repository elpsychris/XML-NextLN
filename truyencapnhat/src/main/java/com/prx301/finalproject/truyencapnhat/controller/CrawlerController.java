package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import com.prx301.finalproject.truyencapnhat.repository.GroupRepo;
import com.prx301.finalproject.truyencapnhat.repository.VolRepo;
import com.prx301.finalproject.truyencapnhat.service.spider.SpiderService;
import com.prx301.finalproject.truyencapnhat.utils.AdapterHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/crawler")
public class CrawlerController {
    private SpiderService spiderService;
    private GenreRepo genreRepo;
    private GroupRepo groupRepo;
    private VolRepo volRepo;

    public CrawlerController(SpiderService spiderService, GenreRepo genreRepo, GroupRepo groupRepo, VolRepo volRepo) {
        this.spiderService = spiderService;
        this.genreRepo = genreRepo;
        this.groupRepo = groupRepo;
        this.volRepo = volRepo;

        AdapterHelper.groupRepo = groupRepo;
        AdapterHelper.genreRepo = genreRepo;
        AdapterHelper.volRepo = volRepo;
    }

    @GetMapping("/")
    public String index(ModelMap modelMap) {
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

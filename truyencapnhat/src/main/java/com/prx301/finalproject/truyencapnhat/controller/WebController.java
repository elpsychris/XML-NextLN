package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.service.web.ProjectService;
import com.prx301.finalproject.truyencapnhat.service.web.UpdateService;
import com.prx301.finalproject.truyencapnhat.utils.ComUtils;
import com.prx301.finalproject.truyencapnhat.utils.StringComparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.transform.dom.DOMResult;
import java.io.InputStream;

@Controller
public class WebController {
    private ProjectService projectService;
    private UpdateService updateService;

    public WebController(ProjectService projectService, UpdateService updateService) {
        this.projectService = projectService;
        this.updateService = updateService;
    }

    @GetMapping("/")
    public String getIndexPage(ModelMap model) {
        String latestUpdateList = updateService.getLatestUpdatesByXML();
        String xsl = ComUtils.getStreamFromFile("latest_item.xsl");

        model.addAttribute("updateList", latestUpdateList);
        model.addAttribute("style", xsl);
        return "index";
    }

    @GetMapping("/project-detail")
    public String getProjectDetail(@RequestParam(name = "name", required = true) int id, ModelMap model) {
//        ProjectEntity projectEntity = projectService.getProjectById(id);
        return "project";
    }

//
//    @GetMapping("/greeting")
//    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
//        model.addAttribute("name", name);
//        return "greeting";
//    }
}

package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.service.web.ProjectService;
import com.prx301.finalproject.truyencapnhat.service.web.UpdateService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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
        List<UpdateEntity> latestUpdateList = updateService.getLatestUpdates();
        model.addAttribute("updateList", latestUpdateList);
        return "index";
    }

    @GetMapping("/project-detail")
    public ModelAndView getProjectDetail(@RequestParam(name = "name", required = true) int id, Model model) {
        ProjectEntity projectEntity = projectService.getProjectById(id);
        return new ModelAndView("project","project",projectEntity);
    }

//
//    @GetMapping("/greeting")
//    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
//        model.addAttribute("name", name);
//        return "greeting";
//    }
}

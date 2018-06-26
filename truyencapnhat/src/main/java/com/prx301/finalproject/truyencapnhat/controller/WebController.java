package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.service.web.ProjectService;
import com.prx301.finalproject.truyencapnhat.service.web.UpdateService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProjectController {
    private ProjectService projectService;
    private UpdateService updateService;

    public ProjectController(ProjectService projectService, UpdateService updateService) {
        this.projectService = projectService;
        this.updateService = updateService;
    }

    @GetMapping("/")
    public ModelAndView index(Model model, @RequestParam(value = "name", required = false, defaultValue = "World") String name) {
        List<UpdateEntity> updateEntityList = updateService.get5LatestUpdates();
        return new ModelAndView("index","updateEntityList", updateEntityList);
    }

    @GetMapping("/greeting")
    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
        model.addAttribute("name", name);
        return "greeting";
    }
}

package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.web.model.AuthTicket;
import com.prx301.finalproject.truyencapnhat.service.web.AccountService;
import com.prx301.finalproject.truyencapnhat.service.web.ProjectService;
import com.prx301.finalproject.truyencapnhat.service.web.UpdateService;
import com.prx301.finalproject.truyencapnhat.utils.ComUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class WebController {
    private ProjectService projectService;
    private UpdateService updateService;
    private AccountService accountService;

    public WebController(ProjectService projectService, UpdateService updateService, AccountService accountService) {
        this.projectService = projectService;
        this.updateService = updateService;
        this.accountService = accountService;
    }

    @GetMapping(value = "/")
    public String getIndexPage(ModelMap model, HttpSession session) {
        String latestUpdateList = updateService.getLatestUpdatesByXML();
        String xsl = ComUtils.getStreamFromFile("latest_item.xsl");

        AuthTicket ticket = null;
        if (ticket == null) {
            String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
            ticket = new AuthTicket(token);
        }

        int role = accountService.checkRole(ticket);
        boolean isAdmin = role == AccountService.LOGIN_AS_ADMIN;
        boolean isUser = role > 0;

        model.addAttribute("updateList", latestUpdateList);
        model.addAttribute("style", xsl);
        model.addAttribute("isAdmin", isAdmin);
        model.addAttribute("isUser", isUser);

        return "index";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST, consumes = MediaType.APPLICATION_XML_VALUE)
    public String getIndexPage(HttpSession session, ModelMap model, @RequestBody AuthTicket ticket) {
        String latestUpdateList = updateService.getLatestUpdatesByXML();
        String xsl = ComUtils.getStreamFromFile("latest_item.xsl");
        if (ticket == null) {
            String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
            ticket = new AuthTicket(token);
        }

        int role = accountService.checkRole(ticket);
        boolean isAdmin = role == AccountService.LOGIN_AS_ADMIN;
        boolean isUser = role > 0;


        model.addAttribute("updateList", latestUpdateList);
        model.addAttribute("style", xsl);
        model.addAttribute("isAdmin", isAdmin);
        model.addAttribute("isUser", isUser);

        return "index";
    }

    @GetMapping("/project-detail")
    public String getProjectDetail(@RequestParam(name = "name", required = true) int id, ModelMap model) {
//        ProjectEntity projectEntity = projectService.getProjectById(id);
        String xml = updateService.getProjectDetail(id);
        String xsl = ComUtils.getStreamFromFile("project_detail.xsl");

        model.addAttribute("sXML", xml);
        model.addAttribute("sXSL", xsl);

        return "project";
    }



//
//    @GetMapping("/greeting")
//    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
//        model.addAttribute("name", name);
//        return "greeting";
//    }
}

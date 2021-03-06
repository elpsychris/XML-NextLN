package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import com.prx301.finalproject.truyencapnhat.model.GenreEntity;
import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.SearchProjects;
import com.prx301.finalproject.truyencapnhat.model.web.model.AuthTicket;
import com.prx301.finalproject.truyencapnhat.service.web.AccountService;
import com.prx301.finalproject.truyencapnhat.service.web.GenreService;
import com.prx301.finalproject.truyencapnhat.service.web.ProjectService;
import com.prx301.finalproject.truyencapnhat.service.web.UpdateService;
import com.prx301.finalproject.truyencapnhat.utils.ComUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class WebController {
    private ProjectService projectService;
    private UpdateService updateService;
    private AccountService accountService;
    private GenreService genreService;


    public WebController(ProjectService projectService, UpdateService updateService, AccountService accountService, GenreService genreService) {
        this.projectService = projectService;
        this.updateService = updateService;
        this.accountService = accountService;
        this.genreService = genreService;
    }

    @GetMapping(value = "/")
    public String getIndexPage(ModelMap model, HttpSession session) {
        String latestUpdateList = updateService.getLatestUpdatesByXML();
        String mostViewList = projectService.getMostViewByXML();
        String xsl = ComUtils.getResourceXSL("latest_item.xsl");
        String mostviewXsl = ComUtils.getResourceXSL("most_view.xsl");

        String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
        AccountEntity accountEntity = accountService.getAccount(token);

        int role = accountService.checkRole(token);
        boolean isAdmin = role == AccountService.LOGIN_AS_ADMIN;
        boolean isUser = role >= 0;

        model.addAttribute("updateList", latestUpdateList);
        model.addAttribute("projectList", mostViewList);
        model.addAttribute("style", xsl);
        model.addAttribute("mostViewStyle", mostviewXsl);
        model.addAttribute("isAdmin", isAdmin);
        model.addAttribute("isUser", isUser);

        model.addAttribute("user", accountEntity);

        return "index";
    }

    @GetMapping(value = "/search")
    public String getSearchPage(ModelMap model, HttpSession session, @RequestParam Map<String, String> params) {
        String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
        String keyword = params.get("keyword");

        int role = accountService.checkRole(token);
        boolean isAdmin = role == AccountService.LOGIN_AS_ADMIN;
        boolean isUser = role >= 0;

        List<GenreEntity> genreEntities = genreService.getAllGenres();

        model.addAttribute("isAdmin", isAdmin);
        model.addAttribute("isUser", isUser);
        model.addAttribute("keyword", keyword);
        model.addAttribute("genres", genreEntities);

        return "search";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST, consumes = MediaType.APPLICATION_XML_VALUE)
    public String getIndexPage(HttpSession session, ModelMap model, @RequestBody AuthTicket ticket) {
        String latestUpdateList = updateService.getLatestUpdatesByXML();
        String mostViewList = projectService.getMostViewByXML();

        String xsl = ComUtils.getResourceXSL("latest_item.xsl");
        String mostviewXsl = ComUtils.getResourceXSL("most_view.xsl");
        String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
        AccountEntity accountEntity = accountService.getAccount(token);
        ;


        int role = accountService.checkRole(token);
        boolean isAdmin = role == AccountService.LOGIN_AS_ADMIN;
        boolean isUser = role >= 0;


        model.addAttribute("updateList", latestUpdateList);
        model.addAttribute("projectList", mostViewList);

        model.addAttribute("style", xsl);
        model.addAttribute("mostViewStyle", mostviewXsl);

        model.addAttribute("isAdmin", isAdmin);
        model.addAttribute("isUser", isUser);
        model.addAttribute("user", accountEntity);

        return "index";
    }

    @GetMapping("/project-detail")
    public String getProjectDetail(@RequestParam(name = "name", required = true) int id, ModelMap model, HttpSession session) {
//        ProjectEntity projectEntity = projectService.getProjectById(id);
        String token = (String) session.getAttribute(AccountService.TOKEN_KEY);
        AccountEntity accountEntity = accountService.getAccount(token);

        List<ProjectEntity> recommendList = projectService.getProjectRecomList(accountEntity);
        SearchProjects sameGenreList = projectService.getSameGenreList(id);

        int role = accountService.checkRole(token);
        boolean isAdmin = role == AccountService.LOGIN_AS_ADMIN;
        boolean isUser = role >= 0;


        String xml = updateService.getProjectDetail(id);
        String xsl = ComUtils.getResourceXSL("project_detail.xsl");
        String xslChap = ComUtils.getResourceXSL("tabl_chap.xsl");
        ProjectEntity project = projectService.getProjectById(id);

        if (recommendList != null && recommendList.size() > 0) {
            model.addAttribute("recommend", recommendList);
        }

        if (sameGenreList != null && sameGenreList.getProjectEntities().size() > 0) {
            model.addAttribute("sameGenre", sameGenreList);
        }

        model.addAttribute("sXML", xml);
        model.addAttribute("sXSLChap", xslChap);
        model.addAttribute("sXSL", xsl);
        model.addAttribute("project", project);
        model.addAttribute("isAdmin", isAdmin);
        model.addAttribute("isUser", isUser);
        model.addAttribute("user", accountEntity);

        return "project";
    }


//
//    @GetMapping("/greeting")
//    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
//        model.addAttribute("name", name);
//        return "greeting";
//    }
}

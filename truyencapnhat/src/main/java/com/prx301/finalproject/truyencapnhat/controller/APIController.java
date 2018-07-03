package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import com.prx301.finalproject.truyencapnhat.model.web.model.AuthTicket;
import com.prx301.finalproject.truyencapnhat.model.web.model.LoginRequest;
import com.prx301.finalproject.truyencapnhat.service.web.AccountService;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class APIController {
    private AccountService accountService = null;

    public APIController(AccountService accountService) {
        this.accountService = accountService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_XML_VALUE, produces = MediaType.APPLICATION_XML_VALUE)
    public AuthTicket login(HttpSession session, @RequestBody LoginRequest loginRequest) {
        return accountService.checkLogin(loginRequest, session);
    }

    @PostMapping("/signup")
    public String signup(@RequestBody AccountEntity signupReq) {
        return "failed";
    }

    @RequestMapping(value = "/logout/{tokenId}", method = RequestMethod.GET)
    public void logout(HttpSession session, @PathVariable("tokenId") String token, ModelMap modelMap) {
        if (token == null || token.isEmpty()) {
            token = (String) session.getAttribute(AccountService.TOKEN_KEY);
        }
        AuthTicket authTicket = new AuthTicket(token);
        accountService.logout(authTicket);
    }
}

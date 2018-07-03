package com.prx301.finalproject.truyencapnhat.controller;

import com.prx301.finalproject.truyencapnhat.model.UserEntity;
import org.springframework.http.MediaType;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class APIController {
    @RequestMapping(value = "/login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String login(@RequestParam Map<String, String> body) {
        String username = body.get("username");
        String password = body.get("password");

        UserEntity newLoginRequest = new UserEntity();
        newLoginRequest.setUsername(username);
        newLoginRequest.setPassword(password);


        return "failed";
    }

    @PostMapping("/signup")
    public String signup(@RequestBody UserEntity signupReq) {
        return "failed";
    }
}

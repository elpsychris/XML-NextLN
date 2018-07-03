package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import com.prx301.finalproject.truyencapnhat.model.web.model.AuthTicket;
import com.prx301.finalproject.truyencapnhat.repository.UserRepo;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {
    private UserRepo userRepo = null;
    private Map<String, String> currentToken = new HashMap<>();

    public final static int LOGIN_AS_ADMIN = 1;
    public final static int LOGIN_AS_USER = 0;
    public final static int LOGIN_FAILED = -1;

    public UserService(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    public AuthTicket checkLogin(AuthTicket authTicket) {
        if (authTicket == null) {
            authTicket.setStateCode(LOGIN_FAILED);
            return authTicket;
        }
        AccountEntity existUser = userRepo.findByUsername(authTicket.getUsername());
        if (existUser != null && existUser.getPassword().equals(authTicket.getPassword())) {
            if (existUser.getAdmin()) {
                authTicket.setStateCode(LOGIN_AS_ADMIN);
                return authTicket;
            }
            authTicket.setStateCode(LOGIN_AS_USER);
            return authTicket;
        }
        authTicket.setStateCode(LOGIN_FAILED);
        return authTicket;
    }
}

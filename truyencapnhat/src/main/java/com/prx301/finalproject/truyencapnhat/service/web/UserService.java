package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import com.prx301.finalproject.truyencapnhat.model.web.model.LoginRequest;
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

    public LoginRequest checkLogin(LoginRequest loginRequest) {
        if (loginRequest == null) {
            loginRequest.setStateCode(LOGIN_FAILED);
            return loginRequest;
        }
        AccountEntity existUser = userRepo.findByUsername(loginRequest.getUsername());
        if (existUser != null && existUser.getPassword().equals(loginRequest.getPassword())) {
            if (existUser.getAdmin()) {
                loginRequest.setStateCode(LOGIN_AS_ADMIN);
                return loginRequest;
            }
            loginRequest.setStateCode(LOGIN_AS_USER);
            return loginRequest;
        }
        loginRequest.setStateCode(LOGIN_FAILED);
        return loginRequest;
    }
}

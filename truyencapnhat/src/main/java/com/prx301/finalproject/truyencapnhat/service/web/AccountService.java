package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import com.prx301.finalproject.truyencapnhat.model.web.model.AuthTicket;
import com.prx301.finalproject.truyencapnhat.model.web.model.LoginRequest;
import com.prx301.finalproject.truyencapnhat.repository.AccountRepo;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@Service
public class AccountService {
    private AccountRepo accountRepo = null;
    private Map<String, LoginRequest> tokenMap = new HashMap<>();

    public final static int LOGIN_AS_ADMIN = 1;
    public final static int LOGIN_AS_USER = 0;
    public final static int LOGIN_FAILED = -1;
    public final static String TOKEN_KEY = "T3-TOKEN";

    public AccountService(AccountRepo accountRepo) {
        this.accountRepo = accountRepo;
    }

    public AuthTicket renderToken(LoginRequest loginRequest, HttpSession session) {
        String newToken = loginRequest.hashCode() + "";
        while (tokenMap.get(newToken) != null) {
            loginRequest.setTime(Calendar.getInstance().getTime().getTime());
            newToken = loginRequest.hashCode() + "";
        }

        session.setAttribute(TOKEN_KEY, newToken);
        tokenMap.put(newToken, loginRequest);
        return new AuthTicket(newToken);
    }

    public int checkRole(AuthTicket ticket) {
        if (ticket == null || ticket.getToken() == null) {
            return LOGIN_FAILED;
        }

        LoginRequest check = tokenMap.get(ticket.getToken());
        if (check == null) {
            return LOGIN_FAILED;
        }

        if (check.isAdmin()) {
            return LOGIN_AS_ADMIN;
        }
        return LOGIN_AS_USER;
    }

    public boolean logout(AuthTicket ticket) {
        if (ticket == null) {
            return false;
        }
        if (checkRole(ticket) > 0) {
            String token = ticket.getToken();
            tokenMap.remove(token);
            return true;
        }
        return false;
    }

    public AuthTicket checkLogin(LoginRequest loginRequest, HttpSession session) {
        if (loginRequest == null) {
            return new AuthTicket();
        }
        AccountEntity existUser = accountRepo.findByUsername(loginRequest.getUsername());
        if (existUser != null && existUser.getPassword().equals(loginRequest.getPassword())) {
            if (existUser.getAdmin()) {
                loginRequest.setAdmin(true);
            }
            return renderToken(loginRequest, session);
        }

        return new AuthTicket();
    }

    public AccountEntity getAccount(String token) {
        LoginRequest loginRequest = tokenMap.get(token);
        return accountRepo.findByUsername(loginRequest.getUsername());
    }
}

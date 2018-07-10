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
    private Map<String, AccountEntity> tokenMap = new HashMap<>();

    public final static int LOGIN_AS_ADMIN = 1;
    public final static int LOGIN_AS_USER = 0;
    public final static int LOGIN_FAILED = -1;
    public final static String TOKEN_KEY = "T3-TOKEN";

    public AccountService(AccountRepo accountRepo) {
        this.accountRepo = accountRepo;
    }

    private String renderToken(LoginRequest loginRequest, HttpSession session, AccountEntity user) {
        String newToken = loginRequest.hashCode() + "";
        while (tokenMap.get(newToken) != null) {
            loginRequest.setTime(Calendar.getInstance().getTime().getTime());
            newToken = loginRequest.hashCode() + "";
        }

        session.setAttribute(TOKEN_KEY, newToken);
        tokenMap.put(newToken, user);
        return newToken;
    }

    public int checkRole(String token) {
        if (token == null || token.isEmpty()) {
            return LOGIN_FAILED;
        }

        AccountEntity check = tokenMap.get(token);
        if (check == null) {
            return LOGIN_FAILED;
        }

        if (check.getAdmin()) {
            return LOGIN_AS_ADMIN;
        }
        return LOGIN_AS_USER;
    }

    public boolean logout(String token, HttpSession session) {
        if (token == null) {
            return false;
        }
        if (checkRole(token) >= 0) {
            tokenMap.remove(token);
            session.removeAttribute(AccountService.TOKEN_KEY);
            return true;
        }
        return false;
    }

    public String checkLogin(LoginRequest loginRequest, HttpSession session) {
        if (loginRequest == null) {
            return null;
        }
        AccountEntity existUser = accountRepo.findByUsername(loginRequest.getUsername());
        if (existUser != null && existUser.getPassword().equals(loginRequest.getPassword())) {
            if (existUser.getAdmin()) {
                loginRequest.setAdmin(true);
            }
            return renderToken(loginRequest, session, existUser);
        }

        return null;
    }

    public AccountEntity getAccount(String token) {
        if (token == null) {
            return null;
        }
        return tokenMap.get(token);
    }

    public String signupAccount(AccountEntity accountEntity) {
        String result = "";
        AccountEntity existUsername = accountRepo.findByUsername(accountEntity.getUsername());
        if (existUsername != null) {
            result = "Tên tài khoản đã tồn tại";
        } else {
            accountRepo.save(accountEntity);
        }
        return result;
    }
}

package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.UserEntity;
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

    public int checkLogin(UserEntity userEntity) {
        if (userEntity == null) {
            return LOGIN_FAILED;
        }
        UserEntity existUser = userRepo.findByUsername(userEntity.getUsername());
        if (existUser.getPassword().equals(userEntity.getPassword())) {
            if (existUser.getAdmin()) {
                return LOGIN_AS_ADMIN;
            }
            return LOGIN_AS_USER;
        }
        return LOGIN_FAILED;
    }
}

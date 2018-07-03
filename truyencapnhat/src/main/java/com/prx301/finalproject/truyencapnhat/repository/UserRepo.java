package com.prx301.finalproject.truyencapnhat.repository;

import com.prx301.finalproject.truyencapnhat.model.AccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<AccountEntity, String> {
    public AccountEntity findByUsername(String username);
}

package com.prx301.finalproject.truyencapnhat.repository;


import org.hibernate.Criteria;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public abstract class AbstractRepo<T, K>  implements JpaRepository<T, K> {
    private static final int PAGE_SIZE = 5;

    protected List<T> getPage(int pageSize) {
        Criteria criteria = this.
    }
}


package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.repository.UpdateRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UpdateService {
    final int DEFAULT_PAGE_SIZE = 10;
    private UpdateRepo updateRepo = null;

    public UpdateService(UpdateRepo updateRepo) {
        this.updateRepo = updateRepo;
    }

    public List<UpdateEntity> getLatestUpdates(int pageNo, int pageSize) {
        return updateRepo.getUpdatePage(pageNo, pageSize);
    }

    public List<UpdateEntity> getLatestUpdates(int pageNo) {
        return updateRepo.getUpdatePage(pageNo, DEFAULT_PAGE_SIZE);
    }

    public List<UpdateEntity> getLatestUpdates() {
        return updateRepo.getUpdatePage(1, DEFAULT_PAGE_SIZE);
    }

    public String getLatestUpdatesByXML() {
        return "";
    }
}

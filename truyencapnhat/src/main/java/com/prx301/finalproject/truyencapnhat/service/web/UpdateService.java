package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.repository.UpdateRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UpdateService {
    private UpdateRepo updateRepo = null;

    public UpdateService(UpdateRepo updateRepo) {
        this.updateRepo = updateRepo;
    }

    public List<UpdateEntity> get5LatestUpdates() {
        return updateRepo.findAll();
    }
}

package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.model.LatestUpdates;
import com.prx301.finalproject.truyencapnhat.repository.UpdateRepo;
import com.prx301.finalproject.truyencapnhat.utils.JAXBUtils;
import com.prx301.finalproject.truyencapnhat.utils.Logger;
import org.springframework.stereotype.Service;

import javax.xml.bind.JAXBException;
import javax.xml.transform.dom.DOMResult;
import java.util.List;

@Service
public class UpdateService {
    final int DEFAULT_PAGE_SIZE = 10;
    private UpdateRepo updateRepo = null;

    public UpdateService(UpdateRepo updateRepo) {
        this.updateRepo = updateRepo;
    }

//    public List<UpdateEntity> getLatestUpdates(int pageNo, int pageSize) {
//        return updateRepo.getUpdatePage(pageNo, pageSize);
//    }
//
//    public List<UpdateEntity> getLatestUpdates(int pageNo) {
//        return updateRepo.getUpdatePage(pageNo, DEFAULT_PAGE_SIZE);
//    }
//
//    public List<UpdateEntity> getLatestUpdates() {
//        return updateRepo.getUpdatePage(1, DEFAULT_PAGE_SIZE);
//    }

    public DOMResult getLatestUpdatesByXML() {
        List<UpdateEntity> updateEntities = updateRepo.getTop5ByOrderByUpdateDateDesc();
        LatestUpdates latestUpdates = new LatestUpdates(updateEntities);
        DOMResult domResult = new DOMResult();
        try {
            JAXBUtils.objectToXML(latestUpdates, domResult);
        } catch (JAXBException e) {
            e.printStackTrace();
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, e, UpdateService.class);
        }
        return domResult;
    }
}

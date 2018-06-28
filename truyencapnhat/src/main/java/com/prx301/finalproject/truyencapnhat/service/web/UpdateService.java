package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.model.LatestUpdates;
import com.prx301.finalproject.truyencapnhat.repository.UpdateRepo;
import com.prx301.finalproject.truyencapnhat.utils.JAXBUtils;
import com.prx301.finalproject.truyencapnhat.utils.Logger;
import org.springframework.stereotype.Service;

import javax.xml.bind.JAXBException;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;
import java.util.List;

@Service
public class UpdateService {
    final int DEFAULT_PAGE_SIZE = 10;
    private UpdateRepo updateRepo = null;

    public UpdateService(UpdateRepo updateRepo) {
        this.updateRepo = updateRepo;
    }

//    public List<UpdateEntity> getLatestUpdates(int pageNo, int pageSize) {
//        return volRepo.getUpdatePage(pageNo, pageSize);
//    }
//
//    public List<UpdateEntity> getLatestUpdates(int pageNo) {
//        return volRepo.getUpdatePage(pageNo, DEFAULT_PAGE_SIZE);
//    }
//
//    public List<UpdateEntity> getLatestUpdates() {
//        return volRepo.getUpdatePage(1, DEFAULT_PAGE_SIZE);
//    }

    public String getLatestUpdatesByXML() {
        List<UpdateEntity> updateEntities = updateRepo.getTop5ByOrderByUpdateDateDesc();
        LatestUpdates latestUpdates = new LatestUpdates(updateEntities);
        StringWriter writer = new StringWriter();

        StreamResult domResult = new StreamResult(writer);
        try {
            JAXBUtils.objectToXML(latestUpdates, domResult);
        } catch (JAXBException e) {
            e.printStackTrace();
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, e, UpdateService.class);
        }
        return writer.toString();
    }
}

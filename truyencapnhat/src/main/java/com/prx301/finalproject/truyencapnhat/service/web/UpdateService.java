package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.*;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import com.prx301.finalproject.truyencapnhat.repository.UpdateRepo;
import com.prx301.finalproject.truyencapnhat.utils.JAXBUtils;
import com.prx301.finalproject.truyencapnhat.utils.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.xml.bind.JAXBException;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;
import java.util.List;

@Service
public class UpdateService {
    final int DEFAULT_PAGE_SIZE = 10;
    private UpdateRepo updateRepo = null;

    @Autowired
    EntityManager em = null;

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

    public LatestUpdates getLatestUpdateEntities(int pageNo) {
        PageRequest pageRequest = PageRequest.of(pageNo, 5, Sort.by(Sort.Order.desc("updateDate")));
        List<UpdateEntity> latestList = updateRepo.findAll(pageRequest).getContent();
        return new LatestUpdates(latestList);
    }

    public PageUpdates getPageUpdate(int pageNo, int projectId) {
        return retrieveUpdatePage(pageNo, 10, projectId);
    }

    public String getProjectDetail(int projectId) {
        PageUpdates firstPage = getPageUpdate(1, projectId);
        StringWriter stringWriter = new StringWriter();
        StreamResult streamResult = new StreamResult(stringWriter);
        try {
            JAXBUtils.objectToXML(firstPage, streamResult);
        } catch (JAXBException e) {
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, e, UpdateService.class);
        }

        return stringWriter.toString();
    }

    private PageUpdates retrieveUpdatePage(int pageNo, int size, int projectId) {
//        this.entityManager.createNativeQuery("BEGIN EXEC UpdateChap_GET_UPDATE :pageNo, :pageSize, :projectId; END;")
//                .setParameter("pageNo", pageNo)
//                .setParameter("pageSize", size)
//                .setParameter("projectId", projectId)
//                .getResultList();
        StoredProcedureQuery findUpdatesByProject = em.createNamedStoredProcedureQuery("get_updates")
                .setParameter("PageNumber", pageNo)
                .setParameter("PageSize", size)
                .setParameter("ProjectID", projectId);
        List<UpdateEntity> result = findUpdatesByProject.getResultList();
        if (result.size() == 0) {
            return new PageUpdates(result, 0);
        }
        int total = (int) findUpdatesByProject.getOutputParameterValue("Total");
        return new PageUpdates(result, total);
    }
}

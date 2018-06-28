package com.prx301.finalproject.truyencapnhat.utils;

import com.prx301.finalproject.truyencapnhat.model.GenreEntity;
import com.prx301.finalproject.truyencapnhat.model.GroupEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateVolEntity;
import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import com.prx301.finalproject.truyencapnhat.repository.GroupRepo;
import com.prx301.finalproject.truyencapnhat.repository.VolRepo;

public class AdapterHelper {
    public static GenreRepo genreRepo = null;
    public static GroupRepo groupRepo = null;
    public static VolRepo volRepo = null;

    public static GenreEntity findGenreExist(String id) {
//        SessionFactory factory = HibernateUtils.getSessionFactory();
//        Session session = factory.getCurrentSession();
//        GenreEntity result = null;
//        try {
//            session.getTransaction().begin();
//            Criteria criteria = session.createCriteria(obj.getClass());
//            criteria.add(Restrictions.eq("genreName", id));
//            result = (GenreEntity) criteria.list().get(0);
//            session.getTransaction().commit();
//        } catch (Exception ex) {
//            if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE) {
//                session.getTransaction().rollback();
//            }
//            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, ex, AdapterHelper.class);
//        }
        return genreRepo.findFirstByGenreId(id);
    }

    public static GroupEntity findGroupExist(String groupName) {
//        SessionFactory factory = HibernateUtils.getSessionFactory();
//        Session session = factory.getCurrentSession();
//        GroupEntity result = null;
//        try {
//            session.getTransaction().begin();
//            Criteria criteria = session.createCriteria(obj.getClass());
//            criteria.add(Restrictions.eq("groupName", groupName));
//            result = (GroupEntity) criteria.list().get(0);
//            session.getTransaction().commit();
//        } catch (Exception ex) {
//            if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE) {
//                session.getTransaction().rollback();
//            }
//            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, ex, AdapterHelper.class);
//        }
        return groupRepo.findFirstByGroupName(groupName);
    }

    public static UpdateVolEntity findVolExist(String volName) {
        return volRepo.findByVolName(volName);
    }
    public static void addNew(GroupEntity groupEntity) {
        groupRepo.save(groupEntity);
    }
    public static void addNew(UpdateVolEntity volEntity) {
        volRepo.save(volEntity);
    }
    public static void addNew(GenreEntity genreEntity) {
//        SessionFactory factory = HibernateUtils.getSessionFactory();
//        Session session = factory.getCurrentSession();
//        try {
//            session.getTransaction().begin();
//            session.save(object);
//            session.flush();
//            session.getTransaction().commit();
//        } catch (Exception ex) {
//            if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE) {
//                session.getTransaction().rollback();
//            }
//            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, ex, AdapterHelper.class);
//        }
        genreRepo.save(genreEntity);
    }
}

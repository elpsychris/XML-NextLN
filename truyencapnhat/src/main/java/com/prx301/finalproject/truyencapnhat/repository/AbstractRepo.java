package com.prx301.finalproject.truyencapnhat.repository;


import crawler.utils.HibernateUtils;
import crawler.utils.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.resource.transaction.spi.TransactionStatus;

import java.util.List;

public abstract class AbstractRepo<T> implements IRepo<T> {
    SessionFactory sessionFactory;
    String idKey = null;
    Logger logger = Logger.getLogger();

    public AbstractRepo() {
        sessionFactory = HibernateUtils.getSessionFactory();
    }

    @Override
    public void add(T item) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.getTransaction().begin();
            session.save(item);
            session.flush();
            session.getTransaction().commit();
        } catch (Exception e) {
            if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE) {
                session.getTransaction().rollback();
            }
            logger.log(Logger.LOG_LEVEL.ERROR, "Add transaction failed: " + item.toString(), e, this.getClass());
        }
    }

    @Override
    public void update(T item) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.getTransaction().begin();
            session.update(item);
            session.flush();
            session.getTransaction().commit();
        } catch (Exception e) {
            if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE) {
                session.getTransaction().rollback();
            }
            logger.log(Logger.LOG_LEVEL.ERROR, "Update transaction failed: " + item.toString(), e, this.getClass());
        }
    }

    @Override
    public void remove(T item) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.getTransaction().begin();
            session.delete(item);
            session.flush();
            session.getTransaction().rollback();
        } catch (Exception e) {
            if (session.getTransaction().getStatus() == TransactionStatus.ACTIVE) {
                session.getTransaction().rollback();
            }
            logger.log(Logger.LOG_LEVEL.ERROR, "Remove transaction failed: " + item.toString(), e, this.getClass());
        }
    }

    @Override
    public List<T> query(Criteria criteria) {
        return criteria.list();
    }

    protected T findExist(Class<T> sampleClass, String key) throws IllegalAccessException, InstantiationException {
        if (idKey == null) {
            System.out.println("idKey cannot be null");
            return null;
        }
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Criteria criteria = session.createCriteria(sampleClass);
        criteria.add(Restrictions.like(idKey, key));
        if (criteria.list().isEmpty()) {
            return null;
        } else {
            return (T) criteria.list().get(0);
        }
    }
}


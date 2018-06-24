package com.prx301.finalproject.truyencapnhat.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class HibernateUtils {
    private static SessionFactory sessionFactory = buildSessionFactory();
    private static Logger logger = Logger.getLogger();

    private static boolean initSessionFactory() {
        Session session = sessionFactory.openSession();

        try {
            session.createSQLQuery("SELECT 1;").list();
            return true;
        } catch (RuntimeException ex) {
            logger.log(Logger.LOG_LEVEL.ERROR, ex, HibernateUtils.class);
        } finally {
            session.close();
        }


        return false;
    }

    public static void closeSessionFactory() {
        sessionFactory.close();
        logger.info("Hiber-Factory closed", HibernateUtils.class);
    }

    private static SessionFactory buildSessionFactory() {
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");

        // creating session factory
        SessionFactory factory = configuration.buildSessionFactory();
        return factory;
    }

    public static SessionFactory getSessionFactory() {
        initSessionFactory();
        return sessionFactory;
    }
}

package com.prx301.finalproject.truyencapnhat.repository;

import crawler.model.GenreEntity;
import crawler.utils.Logger;

public class GenreRepo extends AbstractRepo<GenreEntity> {
    public GenreRepo() {
        this.idKey = "genreId";
    }

    public GenreEntity findExist(GenreEntity obj) {
        try {
            return this.findExist(GenreEntity.class, obj.getGenreId());
        } catch (IllegalAccessException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, this.getClass());
        } catch (InstantiationException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, "Error in the findExist function", e, this.getClass());
        }
        return null;
    }
}

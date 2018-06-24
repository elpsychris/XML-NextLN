package com.prx301.finalproject.truyencapnhat.repository;

import crawler.model.GroupEntity;
import crawler.utils.Logger;

public class GroupRepo extends AbstractRepo<GroupEntity> {
    public GroupRepo() {
        this.idKey = "groupId";
    }

    public GroupEntity findExist(GroupEntity obj) {
        try {
            return this.findExist(GroupEntity.class, obj.getGroupId());
        } catch (IllegalAccessException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, GroupEntity.class);
        } catch (InstantiationException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, "Error in the findExist function", e, GroupEntity.class);
        }
        return null;
    }
}

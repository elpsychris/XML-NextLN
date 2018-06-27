package com.prx301.finalproject.truyencapnhat.utils;

import com.prx301.finalproject.truyencapnhat.model.GroupEntity;
import org.springframework.stereotype.Component;

import javax.xml.bind.annotation.adapters.XmlAdapter;

@Component
public class GroupAdapter extends XmlAdapter<GroupEntity, GroupEntity> {

    @Override
    public GroupEntity unmarshal(GroupEntity v) throws Exception {
        GroupEntity obj = AdapterHelper.findGroupExist(v.getGroupName());
        if (obj == null) {
            AdapterHelper.addNew(v);
            return v;
        } else {
            return obj;
        }
    }

    @Override
    public GroupEntity marshal(GroupEntity v) throws Exception {
        return v;
    }
}

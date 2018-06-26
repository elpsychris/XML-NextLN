package com.prx301.finalproject.truyencapnhat.utils;

import com.prx301.finalproject.truyencapnhat.model.GroupEntity;
import com.prx301.finalproject.truyencapnhat.repository.GroupRepo;
import org.springframework.stereotype.Service;

import javax.xml.bind.annotation.adapters.XmlAdapter;

@Service
public class GroupAdapter extends XmlAdapter<GroupEntity, GroupEntity> {
    private GroupRepo groupRepo;

    public GroupAdapter(GroupRepo groupRepo) {
        this.groupRepo = groupRepo;
    }

    @Override
    public GroupEntity unmarshal(GroupEntity v) throws Exception {
        GroupEntity obj = groupRepo.findFirstByGroupId(v.getGroupId());
        if (obj == null) {
            groupRepo.save(v);
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

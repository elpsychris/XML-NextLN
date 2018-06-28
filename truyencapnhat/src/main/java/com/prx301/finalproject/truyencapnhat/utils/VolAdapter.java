package com.prx301.finalproject.truyencapnhat.utils;

import com.prx301.finalproject.truyencapnhat.model.GenreEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateEntity;
import com.prx301.finalproject.truyencapnhat.model.UpdateVolEntity;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class UpdateAdapter extends XmlAdapter<UpdateVolEntity, UpdateVolEntity> {
    @Override
    public UpdateVolEntity unmarshal(UpdateVolEntity v) {
        UpdateVolEntity obj = AdapterHelper.findVolExist(v.getVolName());
        if (obj == null) {
            AdapterHelper.addNew(v);
            return v;
        } else {
            return obj;
        }
    }

    @Override
    public UpdateVolEntity marshal(UpdateVolEntity v) {
        return v;
    }
}

package com.prx301.finalproject.truyencapnhat.utils;


import com.prx301.finalproject.truyencapnhat.model.GenreEntity;
import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class GenreAdapter extends XmlAdapter<GenreEntity, GenreEntity> {
    @Override
    public GenreEntity unmarshal(GenreEntity v) {
        GenreEntity obj = AdapterHelper.findGenreExist(v.getGenreId());
        if (obj == null) {
            AdapterHelper.addNew(v);
            return v;
        } else {
            return obj;
        }
    }

    @Override
    public GenreEntity marshal(GenreEntity v) throws Exception {
        return v;
    }
}

package com.prx301.finalproject.truyencapnhat.utils;


import com.prx301.finalproject.truyencapnhat.model.GenreEntity;
import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import org.springframework.stereotype.Service;

import javax.xml.bind.annotation.adapters.XmlAdapter;

@Service
public class GenreAdapter extends XmlAdapter<GenreEntity, GenreEntity> {
    private GenreRepo genreRepo = null;

    public GenreAdapter(GenreRepo genreRepo) {
        this.genreRepo = genreRepo;
    }

    @Override
    public GenreEntity unmarshal(GenreEntity v) throws Exception {
        GenreEntity obj = genreRepo.findFirstByGenreId(v.getGenreId());
        if (obj == null) {
            genreRepo.save(v);
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

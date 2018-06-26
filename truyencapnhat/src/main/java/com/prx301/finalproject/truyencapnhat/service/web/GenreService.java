package com.prx301.finalproject.truyencapnhat.service.web;

import com.prx301.finalproject.truyencapnhat.model.GenreEntity;
import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.repository.GenreRepo;
import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GenreService {
    private GenreRepo genreRepository;

    public GenreService(GenreRepo genreRepository) {
        this.genreRepository = genreRepository;
    }

    public boolean findExist(GenreEntity genreEntity) {
        return genreRepository.findFirstByGenreId(genreEntity.getGenreId()) != null;
    }
}

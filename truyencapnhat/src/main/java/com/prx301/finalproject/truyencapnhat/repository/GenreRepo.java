package com.prx301.finalproject.truyencapnhat.repository;


import com.prx301.finalproject.truyencapnhat.model.GenreEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GenreRepo extends JpaRepository<GenreEntity, String> {
   public GenreEntity findFirstByGenreId(String genreId);
}

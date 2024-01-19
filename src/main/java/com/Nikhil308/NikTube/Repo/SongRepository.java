package com.Nikhil308.NikTube.Repo;

import  com.Nikhil308.NikTube.Model.Song;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SongRepository extends JpaRepository<Song, Long>{


    Optional<Song> findByVname(String query);

}

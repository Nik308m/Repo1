package com.Nikhil308.NikTube.Repo;

import com.Nikhil308.NikTube.Model.Song;
import com.Nikhil308.NikTube.Model.Video;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VideoRepository extends JpaRepository<Video, Long> {


    Optional<Video> findByVname(String query);

}

package com.Nikhil308.NikTube.Controllers;



import com.Nikhil308.NikTube.Model.Song;
import com.Nikhil308.NikTube.Model.Video;
import com.Nikhil308.NikTube.Repo.SongRepository;
import com.Nikhil308.NikTube.Repo.VideoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;

@RestController
@RequestMapping("/musicpage")
public class MusicController {

    private final SongRepository dataRepository;

    @Autowired
    public MusicController(SongRepository dataRepository) {
        this.dataRepository = dataRepository;
    }

    @PostMapping("/upload")
    public ResponseEntity<UploadResponse> uploadFilesm(
            @RequestParam("musicFile") MultipartFile musicFile,
            @RequestParam("mname") String mname,
            @RequestParam("mdescription") String mdescription) {

        // Handle the file upload logic here
        // You can save the files, process them, etc.
        try {
            byte[] musicContent = musicFile.getBytes();
            Song musicData = new Song((byte[])musicContent,mname,mdescription);
            dataRepository.save(musicData);
            UploadResponse response = new UploadResponse("Music File uploaded successfully!");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (IOException e) {
            UploadResponse response = new UploadResponse("Error uploading Music file: " + e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }


    }
    private static class UploadResponse {
        private final String message;

        public UploadResponse(String message) {
            this.message = message;
        }

        public String getMessage() {
            return message;
        }
    }


    @GetMapping(value = "/musicfiles/{id}", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public ResponseEntity<byte[]> getMusicMediaContent(@PathVariable Long id) {
        Optional<Song> optionalMediaEntity = dataRepository.findById(id);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", "music.mp3");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        if (optionalMediaEntity.isPresent()) {
            Song mediaEntity = optionalMediaEntity.get();
            return ResponseEntity.ok().headers(headers).body(mediaEntity.getContent());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping(value = "/music/{query}", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public ResponseEntity<byte[]> getMediaContentByName(@PathVariable String query) {
        Optional<Song> optionalMediaEntity = dataRepository.findByVname(query);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", "video.mp4");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        if (optionalMediaEntity.isPresent()) {
            Song mediaEntity = optionalMediaEntity.get();
            return ResponseEntity.ok().headers(headers).body(mediaEntity.getContent());
        } else {
            return ResponseEntity.notFound().build();
        }
    }


}

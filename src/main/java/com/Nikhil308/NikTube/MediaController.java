package com.Nikhil308.NikTube;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/////media")
public class MediaController {

    private final NikTubeDataRepository dataRepository;


    public MediaController(NikTubeDataRepository dataRepository) {
        this.dataRepository = dataRepository;
    }

    @GetMapping(value = "/music/{id}", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public ResponseEntity<byte[]> getMusicMediaContent(@PathVariable Long id) {
        Optional<NikTubeData> optionalMediaEntity = dataRepository.findById(id);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", "music.mp3");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        if (optionalMediaEntity.isPresent()) {
            NikTubeData mediaEntity = optionalMediaEntity.get();
            System.out.println("Content Type: " + mediaEntity.getClass());
            System.out.println("Content Length: " + mediaEntity.getContent().length);
            return ResponseEntity.ok().headers(headers).body(mediaEntity.getContent());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping(value = "/video/{id}", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public ResponseEntity<byte[]> getMediaContent(@PathVariable Long id) {
        Optional<NikTubeData> optionalMediaEntity = dataRepository.findById(id);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", "video.mp4");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        if (optionalMediaEntity.isPresent()) {
            NikTubeData mediaEntity = optionalMediaEntity.get();
            System.out.println("Content Type: " + mediaEntity.getClass());
            System.out.println("Content Length: " + mediaEntity.getContent().length);
            return ResponseEntity.ok().headers(headers).body(mediaEntity.getContent());
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}


package com.Nikhil308.NikTube;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.HttpStatus;
import com.Nikhil308.NikTube.NikTubeDataRepository;

import java.io.IOException;

@Controller
@RequestMapping("////")
public class HomeController {
    private final NikTubeDataRepository dataRepository;

    @Autowired
    public HomeController(NikTubeDataRepository dataRepository) {
        this.dataRepository = dataRepository;
    }

    @RequestMapping("/")
    String  homepage(){

        return "HomePage.jsp";
    }
    @RequestMapping("/media")
    String  mediapage(){

        return "Streamer.jsp";
    }

 @PostMapping("/upload")
 public ResponseEntity<UploadResponse> uploadFiles(
         @RequestParam("musicFile") MultipartFile musicFile,
         @RequestParam("mname") String mname,
         @RequestParam("mdescription") String mdescription,

         @RequestParam("videoFile") MultipartFile videoFile,
         @RequestParam("vname") String vname,
         @RequestParam("vdescription") String vdescription) {
     // Handle the file upload logic here
     // You can save the files, process them, etc.
     try {
         byte[] musicContent = musicFile.getBytes();
         byte[] videoContent = videoFile.getBytes();

         NikTubeData musicData = new NikTubeData((byte[])musicContent,mname,mdescription);
         NikTubeData videoData = new NikTubeData((byte[])videoContent,vname,vdescription);

         dataRepository.save(musicData);
         dataRepository.save(videoData);

         UploadResponse response = new UploadResponse("Files uploaded successfully!");
         return new ResponseEntity<>(response, HttpStatus.OK);
     } catch (IOException e) {
         UploadResponse response = new UploadResponse("Error uploading files: " + e.getMessage());
         return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
     }


 }



    @PostMapping("/uploadm")
    public ResponseEntity<UploadResponse> uploadFilesm(
            @RequestParam("musicFile") MultipartFile musicFile,
            @RequestParam("mname") String mname,
            @RequestParam("mdescription") String mdescription) {
        // Handle the file upload logic here
        // You can save the files, process them, etc.
        try {
            byte[] musicContent = musicFile.getBytes();
            NikTubeData musicData = new NikTubeData((byte[])musicContent,mname,mdescription);
            dataRepository.save(musicData);
            UploadResponse response = new UploadResponse("Music File uploaded successfully!");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (IOException e) {
            UploadResponse response = new UploadResponse("Error uploading Music file: " + e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }


    }


    @PostMapping("/uploadv")
    public ResponseEntity<UploadResponse> uploadFilesv(
            @RequestParam("videoFile") MultipartFile videoFile,
            @RequestParam("vname") String vname,
            @RequestParam("vdescription") String vdescription) {
        // Handle the file upload logic here
        // You can save the files, process them, etc.
        try {
            byte[] videoContent = videoFile.getBytes();
            NikTubeData videoData = new NikTubeData((byte[])videoContent,vname,vdescription);
            dataRepository.save(videoData);

            UploadResponse response = new UploadResponse("Video File uploaded successfully!");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (IOException e) {
            UploadResponse response = new UploadResponse("Error uploading Video file: " + e.getMessage());
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

}

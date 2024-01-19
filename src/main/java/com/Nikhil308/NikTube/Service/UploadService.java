package com.Nikhil308.NikTube.Service;


import com.Nikhil308.NikTube.Model.Song;
import com.Nikhil308.NikTube.Model.Video;

import com.Nikhil308.NikTube.NikTubeDataRepository;
import com.Nikhil308.NikTube.Repo.SongRepository;
import com.Nikhil308.NikTube.Repo.VideoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public class UploadService {

    private final SongRepository mdataRepository;
    private final VideoRepository vdataRepository;

    @Autowired
    public UploadService(SongRepository mdataRepository,VideoRepository vdataRepository) {
        this.mdataRepository = mdataRepository;
        this.vdataRepository = vdataRepository;
    }

    public boolean uploadFiles(MultipartFile justFile, String mname,String mdescription,
            String fileType) {
        // Handle the file upload logic here
        // You can save the files, process them, etc.
        try {
            byte[] justContent = justFile.getBytes();

            if(fileType.equals("music")){
                Song musicData = new Song((byte[])justContent,mname,mdescription);
                mdataRepository.save(musicData);
            }
            if(fileType.equals("video")){
                Video videoData = new Video((byte[])justContent,mname,mdescription);
                vdataRepository.save(videoData);
            }
            return true;
        } catch (IOException e) {
            System.out.println("Error Occurred during Uploading of File  "+e);
            return false;
        }
    }
}

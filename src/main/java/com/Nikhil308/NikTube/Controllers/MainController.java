package com.Nikhil308.NikTube.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/")
public class MainController {
    public MainController() {  }

    @RequestMapping("/home")
    String  homepage(){

        return "NikVideoPlay.jsp";
    }
    @RequestMapping("/streamvideo")
    String  streamVideo(){

        return "StreamVideo.jsp";
    }

    @RequestMapping("/streammusic")
    String  streamMusic(){

        return "StreamMusic.jsp";
    }

    @RequestMapping("/uploadmusic")
    String  uploadMusic(){

        return "UploadMusic.jsp";
    }

    @RequestMapping("/uploadvideo")
    String  uploadVideo(){

        return "UploadVideo.jsp";
    }

}

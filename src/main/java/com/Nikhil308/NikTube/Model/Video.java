package com.Nikhil308.NikTube.Model;

import jakarta.persistence.*;


@Entity
@Table(name = "VideosData")
public class Video {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Lob
    @Column(name = "content", columnDefinition = "byte[]")
    private byte[] content;

    // Add other fields as needed
    @Column(name = "vname")
    private String vname;

    @Column(name = "vdescription")
    private String vdescription;



    public Video() {
    }

    public Video(byte[] content,String dname, String ddescription) {
        this.vname=dname;
        this.vdescription=ddescription;
        this.content = content;
    }

    // Getters and setters
    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }


    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public String getVdescription() {
        return vdescription;
    }

    public void setVdescription(String vdescription) {
        this.vdescription = vdescription;
    }


}

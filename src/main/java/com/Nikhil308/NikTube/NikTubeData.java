package com.Nikhil308.NikTube;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Column;
import jakarta.persistence.Lob;


@Entity
@Table(name = "NikTubeData")
public class NikTubeData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Lob
    @Column(name = "content", columnDefinition = "byte[]")
    private byte[] content;

    // Add other fields as needed
    @Column(name = "Name")
    private String vname;

    @Column(name = "Description")
    private String vdescription;



    public NikTubeData() {
    }

    public NikTubeData(byte[] content,String dname, String ddescription) {
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


<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NikTube</title>
    <style>
        body {
          font-family: Arial, sans-serif;
        }
        form {
          margin: 20px;
        }
    </style>
</head>
<body bgcolor="#00ffff">
<h2>File Upload</h2>

<label for="musicFile">Please Enter the Name for the Music File</label>
<input type="text" id="vmname" >
<label for="musicFile">Please Enter the Description for the Music File</label>
<input type="text" id="vmdescription" ><br>

<label for="musicFile">Upload Music File:</label>
<input type="file" id="musicFile" accept="audio/*">
<button onclick="uploadFilesm()">Upload Music File</button>
 <br><br> <br><br>


<label for="videoFile">Please Enter the Name for the Video File</label>
<input type="text" id="vvname" >
<label for="videoFile">Please Enter the Description for the Video File</label>
<input type="text" id="vvdescription" ><br>

<label for="videoFile">Upload Video File:</label>
<input type="file" id="videoFile" accept="video/*">
<button onclick="uploadFilesv()">Upload Video File</button>
 <br><br><br>

<button onclick="uploadFiles()">Upload Both Video and Music Files</button>
<script>
    function uploadFiles() {
      var musicFileInput = document.getElementById('musicFile');
      var videoFileInput = document.getElementById('videoFile');

      var vmname = document.getElementById('vmname').value;
      var vmdescription = document.getElementById('vmdescription').value;

       var vvname = document.getElementById('vvname').value;
       var vvdescription = document.getElementById('vvdescription').value;

      var musicFile = musicFileInput.files[0];
      var videoFile = videoFileInput.files[0];

      if (!musicFile || !videoFile) {
        alert('Please select both music and video files.');
        return;
      }

      var formData = new FormData();
      formData.append('musicFile', musicFile);
      formData.append('mname', vmname);
      formData.append('mdescription', vmdescription);

      formData.append('vname', vvname);
      formData.append('vdescription', vvdescription);
      formData.append('videoFile', videoFile);


      // Replace 'http://localhost:8080' with the actual URL of your Spring Boot application
      fetch('/upload', {
        method: 'POST',
        body: formData
      })
      .then(response => response.json())
      .then(data => {
        alert('Files uploaded successfully!');
        console.log(data);
      })
      .catch(error => {
        alert('Error uploading files In NikTube.');
        console.error(error);
      });
    }
 function uploadFilesm() {
      var musicFileInput = document.getElementById('musicFile');
      var vmnameInput = document.getElementById('vmname');
      var vmdescriptionInput = document.getElementById('vmdescription');

      var musicFile = musicFileInput.files[0];
      var vmname=vmnameInput.value;
      var vmdescription=vmdescriptionInput.value;
      if (!musicFile) {
        alert('Please select a music a Valid file.');
        return;
      }

      var formData = new FormData();
      formData.append('musicFile', musicFile);
      formData.append('mname', vmname);
      formData.append('mdescription', vmdescription);
      // Replace 'http://localhost:8080' with the actual URL of your Spring Boot application
      fetch('/uploadm', {
        method: 'POST',
        body: formData
      })
      .then(response => response.json())
      .then(data => {
        alert('Music File uploaded successfully! on NikTube');
        console.log(data);
      })
      .catch(error => {
        alert('Error uploading Music file In NikTube.');
        console.error(error);
      });
    }


    function uploadFilesv() {
          var videoFileInput = document.getElementById('videoFile');
           var vvname = document.getElementById('vvname').value;
           var vvdescription = document.getElementById('vvdescription').value;
          var videoFile = videoFileInput.files[0];

          if (!videoFile) {
            alert('Please select s Valid video file.');
            return;
          }

          var formData = new FormData();
          formData.append('videoFile', videoFile);
          formData.append('vname', vvname);
          formData.append('vdescription', vvdescription);


          // Replace 'http://localhost:8080' with the actual URL of your Spring Boot application
          fetch('/uploadv', {
            method: 'POST',
            body: formData
          })
          .then(response => response.json())
          .then(data => {
            alert('Video File uploaded successfully! on NikTube');
            console.log(data);
          })
          .catch(error => {
            alert('Error uploading Video file In NikTube.');
            console.error(error);
          });
        }

    function myFunction() {
    window.location.href = "/media";
    }
</script>
<hr><br><br>
<button onclick="myFunction()">Click here to watch videos or Listen Music from the Database</button>
</body>
</html>
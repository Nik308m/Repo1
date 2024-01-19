<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title > &#127794 &#127795 &#127796  &#129442 NikTube &#129434  &#127796  &#127795 &#127794 </title>
  <style>
          body {
              font-family: 'Arial', sans-serif;
              margin: 0;
              padding: 0;
              background-color: #f9f9f9;
              color: #333;
          }

          header {
              background-color: #fff;
              padding: 20px;
              box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
              display: flex;
              justify-content: space-between;
              align-items: center;
          }

          h1 {
              color: #e44d26;
              margin: 0;
          }

          .container {
              max-width: 600px;
              margin: 20px auto;
              padding: 20px;
              background-color: #fff;
              border-radius: 8px;
              box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
          }

          label {
              display: block;
              margin-bottom: 8px;
          }

          input {
              width: calc(100% - 22px);
              padding: 10px;
              margin-bottom: 15px;
              box-sizing: border-box;
              border: 1px solid #ccc;
              border-radius: 4px;
              display: inline-block;
              vertical-align: top;
          }

          #musicFile {
              width: calc(100% - 22px);
              padding: 10px;
              box-sizing: border-box;
              border: 1px solid #ccc;
              border-radius: 4px;
              display: inline-block;
              vertical-align: top;
          }

          button {
              background-color: #e44d26;
              color: #fff;
              padding: 12px 20px;
              border: none;
              border-radius: 4px;
              cursor: pointer;
              font-size: 16px;
          }

          button:hover {
              background-color: #333;
          }

          .navigation-buttons {
              text-align: center;
              margin-top: 20px;
          }

          .navigation-buttons button {
              margin: 5px;
              background-color: #333;
              color: #fff;
              border: none;
              padding: 10px 15px;
              border-radius: 4px;
              cursor: pointer;
          }

          .navigation-buttons button:hover {
              background-color: #555;
          }
      </style>
</head>
<body bgcolor="#00ffff">

<header>
        <h1>NikTube Videos</h1>
    </header>
<div class="container">
<h2>File Upload</h2>
<label for="videoFile">Please Enter the Name for the Video File</label>
<input type="text" id="vvname" >
<label for="videoFile">Please Enter the Description for the Video File</label>
<input type="text" id="vvdescription" ><br><br><br>

<label for="videoFile">Upload Video File:</label>
<input type="file" id="videoFile" accept="video/*">
<button onclick="uploadFilesv()">Upload Video File</button>
</div>

<script>


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
          fetch('/videopage/upload', {
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
       window.location.href = "/streammusic";
       }
        function myFunction1() {
              window.location.href = "/uploadmusic";
              }

               function myFunction2() {
                     window.location.href = "/streamvideo";
                     }

                      function myFunction3() {
                            window.location.href = "/uploadvideo";
                            }
</script>
 <div class="navigation-buttons">
        <button onclick="myFunction()">Go to Music Streaming Page</button>
        <button onclick="myFunction1()">Go to Music Upload Page</button>
        <button onclick="myFunction2()">Go to Video Streaming Page</button>
        <button onclick="myFunction3()">Go to Video Upload Page</button>
    </div>
</body>
</html>
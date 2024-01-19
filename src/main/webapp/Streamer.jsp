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
<body bgcolor="cyan">
    <h2>File Streamer</h2>

    <form id="mediaForm">
        <label for="mediaId">Enter Media ID:</label>
        <input type="text" id="mediaId" name="mediaId" required>
        <label>
            <input type="radio" name="mediaType" value="music" checked> Music
        </label>
        <label>
            <input type="radio" name="mediaType" value="video"> Video
        </label>
        <button type="button" onclick="playMedia()">Play Media</button>
    </form>

    <h1>Streaming Music/Video</h1>

    <!-- Audio element for streaming music -->
    <audio controls id="audioPlayer">
        Your browser does not support the audio tag.
    </audio>

    <!-- Video element for streaming video -->
    <video controls id="videoPlayer" style="max-width: 100%;">
        Your browser does not support the video tag.
    </video>

    <script>
        function playMedia() {
            const mediaId = document.getElementById('mediaId').value;
            const mediaType = document.querySelector('input[name="mediaType"]:checked').value;
            const url = "/media/"+mediaType+"/"+mediaId;
            fetch(url, {
                method: 'GET',
                headers: {
                    'Accept': 'application/octet-stream'
                }
            })
            .then(response => { if (!response.ok) {
                                throw new Error(`HTTP error! Status: ${response.status}`);
                                    }
            return response.blob();
            })
            .then(blob => {
                if (mediaType === 'music') {
                    const audioPlayer = document.getElementById('audioPlayer');
                    const blobUrl = URL.createObjectURL(blob);
                    audioPlayer.src = blobUrl;
                    audioPlayer.play();  // Play the audio
                } else if (mediaType === 'video') {
                    const videoPlayer = document.getElementById('videoPlayer');
                    const blobUrl = URL.createObjectURL(blob);
                    videoPlayer.src = blobUrl;
                    videoPlayer.play();  // Play the video
                }
            })
            .catch(error => console.error('Error fetching media:', error));
        }
    </script>
</body>
</html>

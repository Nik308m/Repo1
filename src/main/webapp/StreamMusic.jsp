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
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f9f9f9;
              }

              header {
                background-color: #fff;
                padding: 3px;
                box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
                display: flex;
                justify-content: space-between;
                align-items: center;
                //font-family: 'Brush Script MT';

              }


              footer {
                   position: fixed;
                   left: 0;
                   bottom: 0;
                   height:9%;
                   width: 100%;
                   background-color: #ff6600;
                   color: white;
                   text-align: center;
                    font-family: Copperplate, Papyrus, fantasy;
                    opacity: 0; /* Initially set the opacity to 0 */
                                 transition: opacity 0.3s;
              }
              footer:hover {
                                     opacity: 1; /* Make the header fully visible when hovering over it */
                                 }

           form {
             margin: 20px;
           }

           .button-container {
                      display: flex;

               }



          .button {
     background-color: #04AA6D; /* Green */
     border: none;
     color: white;
     padding: 16px 32px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
     font-size: 16px;
     margin: 4px 2px;
     transition-duration: 0.4s;
     cursor: pointer;
   }

   .button1 {
     background-color: white;
     color: black;
     border: 2px solid #04AA6D;
   }

   .button1:hover {
     background-color: #04AA6D;
     color: white;
   }

   .button2 {
     background-color: white;
     color: black;
     border: 2px solid #008CBA;
   }

   .button2:hover {
     background-color: #008CBA;
     color: white;
   }

   .button3 {
     background-color: white;
     color: black;
     border: 2px solid #f44336;
   }

   .button3:hover {
     background-color: #f44336;
     color: white;
   }

   .button4 {
     background-color: white;
     color: black;
     border: 2px solid #555555;
   }

   .button4:hover {
     background-color: #555555;
     color: white;
   }
         video{
              max-width: 100%;
              height=160;
                border-radius: 8px; /* Optional: Add border-radius for a rounded look */
               box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Optional: Add a subtle box shadow */
               border: 2px solid #99004d; /* Add border with a 2px width and color #ccc */
              }


   figure {
     max-width: 64rem;
     width: 95%;
     max-height: 30.875rem;
     height: 100%;
     margin: 1.25rem auto;
     padding: 1.051%;
     //background-color: #666;
   }
       </style>
</head>
<body bgcolor="#00ffff">
 <header>
    <h1> &#127909 &#128250 &#127931 <B>NikTube Music </B> </h1>
    <input type="text" id="searchInput" placeholder="Search...">
    <button onclick="searchMusic()" onmouseover="mOver(this)" onmouseout="mOut(this)" >Search</button>
  </header><br><br>

      <center>
           <figure>
                <!-- Audio element for streaming music -->
                     <audio controls id="audioPlayer">
                         Your browser does not support the audio tag.
                     </audio>
      </figure>
              </center>




<!-- This Javascript code changes the Content of Search Button Back and Forth after Hovering -->
<script>
function mOver(obj) {
  obj.innerHTML = "Start Searching..."
}

function mOut(obj) {
  obj.innerHTML = "Search !!!"
}
</script>

<script>
<!-- This Javascript code Sends the GET request for serching Data in Databaseof Server -->
 function searchMusic() {
            const medianame = document.getElementById('searchInput').value;
            const url = "/musicpage/music/"+ medianame;
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
                if ('music' === 'music') {
                    const audioPlayer = document.getElementById('audioPlayer');
                    const blobUrl = URL.createObjectURL(blob);
                    audioPlayer.src = blobUrl;
                    audioPlayer.play();  // Play the audio
                }
            })
            .catch(error => console.error('Error fetching media:', error));
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
<noscript>Sorry, your browser does not support JavaScript!</noscript>

<div class="button-container">  <span style="width:80px;"></span> <button class="button button1" onclick="myFunction()"> &#128251 Go to Music Streaming Page </button>
<br> <span style="width:80px;"></span>
<button class="button button2" onclick="myFunction1()"> &#127927 Go to Music Upload Page </button>
<br> <span style="width:80px;"></span>
<button class="button button3" onclick="myFunction2()"> &#128250 Go to Video Streaming Page</button>
<br> <span style="width: 80px;"></span>
<button class="button button4" onclick="myFunction3()"> &#127909 Go to Video Upload Page</button> <span style="width:80px;"></span>  </div>

 <footer>
  <p> <B>Author: Nikhil R Patil </B></p>
</footer>

</body>
</html>



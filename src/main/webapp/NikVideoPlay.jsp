<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background: linear-gradient(to right, #ff0000, #ff6b00); /* Vibrant gradient background */
      color: #fff;
      margin: 0;
      padding: 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }

    header {
      background: linear-gradient(to right, #ff0000, #ff6b00); /* Use the same vibrant gradient for the header */
      padding: 10px;
      box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 100%;
      position: fixed;
      top: 0;
    }

    h1 {
      margin-bottom: 10px;
      margin-top: 0;
    }

    .button-container {
      display: flex;
      align-items: center;
      justify-content: center;
      flex-wrap: wrap; /* Added to make buttons wrap to the next line if needed */
      margin-top: 80px;
    }

    .button {
      background-color: #ff0000; /* Use a vibrant red color for the buttons */
      border: none;
      color: white;
      padding: 16px 32px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px;
      transition-duration: 0.4s;
      cursor: pointer;
    }

    .button1 {
      background-color: #ff6b00; /* Use a slightly different shade for the first button */
      color: white;
      border: 2px solid #ff0000;
    }

    .button1:hover {
      background-color: #ff0000;
      color: white;
    }

    .button2 {
      background-color: #ff6b00; /* Use the same shade for the second button */
      color: white;
      border: 2px solid #ff0000;
    }

    .button2:hover {
      background-color: #ff0000;
      color: white;
    }

    .button3 {
      background-color: #ff6b00; /* Use the same shade for the third button */
      color: white;
      border: 2px solid #ff0000;
    }

    .button3:hover {
      background-color: #ff0000;
      color: white;
    }

    .button4 {
      background-color: #ff6b00; /* Use the same shade for the fourth button */
      color: white;
      border: 2px solid #ff0000;
    }

    .button4:hover {
      background-color: #ff0000;
      color: white;
    }
  </style>
  <title>&#127794 &#127795 &#127796  &#129442 NikTube &#129434  &#127796  &#127795 &#127794 </title>
</head>
<body>

  <header>
    <h1>&#127909 &#128250 &#127931 <strong>NikTube</strong></h1>
  </header>

  <div class="button-container">
    <button class="button button1" onclick="myFunction()"> &#128251 Go to Music Streaming Page</button>
    <button class="button button2" onclick="myFunction1()"> &#127927 Go to Music Upload Page</button>
    <button class="button button3" onclick="myFunction2()"> &#128250 Go to Video Streaming Page</button>
    <button class="button button4" onclick="myFunction3()"> &#127909 Go to Video Upload Page</button>
  </div>

  <script>
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

</body>
</html>

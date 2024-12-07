<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback</title>
  <link rel="stylesheet" href="./css/feedback.css">
 	
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
    background-image: url('./images/HomePage.jpg');
    margin: 0;
    background-size: 100% auto; /* Adjusts the width to 100% of the screen, height auto */
    background-attachment: fixed;
    background-position: center top; /* Keeps the image centered at the top */
    background-repeat: no-repeat; /* Prevents repeating of the image */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full height of the viewport */
}
.feedback-container {
    max-width: 400px;
    background-color: #fff;
    padding: 30px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    min-height: 150px; /* Decreased minimum height */
    margin-left: 920px;
    margin-top: 143px;
}


.feedback-container h1 {
    text-align: center;
    color: #1d07a9;
    margin-bottom: 20px;
}

.feedback-container p {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
}

.feedback-container form {
    display: flex;
    flex-direction: column;
}

.feedback-container form label {
    margin-bottom: 5px;
    font-weight: bold;
}

.feedback-container form input,
.feedback-container form textarea {
    margin-bottom: 15px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 16px;
}

.feedback-container form button {
    background-color: #1d07a9;
    color: white;
    border: none;
    padding: 10px;
    font-size: 18px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.feedback-container form button:hover {
    background-color: #140680;
}


  </style>
</head>
<body>
    <nav>
    <div class="navbar">
      <div class="logo"><a href="index.jsp">CareerStream</a></div>
      <ul class="menu">
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
      </ul>
    </div>
  </nav>

  <div class="feedback-container">
    <h1>We Value Your Feedback</h1>
    <p>Please share your thoughts and suggestions below.</p>
    <form action="#" method="POST">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" placeholder="Your Name" required>

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" placeholder="Your Email" required>

      <label for="message">Message:</label>
      <textarea id="message" name="message" rows="5" placeholder="Your Feedback" required></textarea>

      <button type="submit">Submit Feedback</button>
    </form>
  </div>
</body>
</html>

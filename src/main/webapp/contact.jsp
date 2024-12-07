<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="UTF-8">
  <title>Contact Us</title>
  <link rel="stylesheet" href="./css/contact.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    .contact .details .item {
      margin-bottom: 15px;
      display: flex;
      align-items: center;
    }
    .contact .details .item i {
      font-size: 24px;
      margin-right: 15px;
      color: #1d07a9;
    }
    .contact .details .item a {
      color: #333;
      text-decoration: none;
    }
    .contact .details .item a:hover {
      text-decoration: underline;
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

  <section class="contact">
    <div class="container">
      <h1>Contact Us</h1>
      <p>If you have any questions or need further information, please feel free to reach out to us through the following contact details:</p>
      <div class="details">
        <div class="item">
          <i class="fas fa-envelope"></i>
          <a href="mailto:info@example.com">info@example.com</a>
        </div>
        <div class="item">
          <i class="fas fa-phone"></i>
          <a href="tel:+1234567890">+1 234 567 890</a>
        </div>
        <div class="item">
          <i class="fab fa-instagram"></i>
          <a href="https://instagram.com/yourprofile" target="_blank">Instagram</a>
        </div>
        <div class="item">
          <i class="fab fa-telegram"></i>
          <a href="https://t.me/yourprofile" target="_blank">Telegram</a>
        </div>
      </div>
    </div>
  </section>
</body>
</html>

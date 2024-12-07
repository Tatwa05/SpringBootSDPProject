<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .success-box {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            max-width: 500px;
        }
        h1 {
            color: #02206c;
            margin-bottom: 20px;
        }
        .tick-mark {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background-color: #4CAF50;
            position: relative;
            animation: scale-up 0.5s ease-in-out;
        }
        .tick-mark::before,
        .tick-mark::after {
            content: '';
            position: absolute;
            background-color: white;
        }
        .tick-mark::before {
            width: 20px;
            height: 4px;
            left: 20px;
            top: 46px;
            transform: rotate(45deg);
            animation: draw-left 0.3s ease-in-out 0.5s forwards;
        }
        .tick-mark::after {
            width: 40px;
            height: 4px;
            left: 28px;
            top: 40px;
            transform: rotate(-45deg);
            animation: draw-right 0.3s ease-in-out 0.8s forwards;
        }
        @keyframes scale-up {
            0% { transform: scale(0); }
            100% { transform: scale(1); }
        }
        @keyframes draw-left {
            0% { width: 0; }
            100% { width: 20px; }
        }
        @keyframes draw-right {
            0% { width: 0; }
            100% { width: 40px; }
        }
        .back-to-login {
            display: inline-block;
            margin-top: 20px;
            color: #02206c;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .back-to-login:hover {
            color: #0324c9;
        }
    </style>
</head>
<body>
    <div class="success-box">
        <h1>Registration Successful</h1>
        <div class="tick-mark"></div>
        <a href="rlogin" class="back-to-login">Back to Login Page</a>
    </div>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration Form</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet"  href="../css/navbar.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            margin-top: 450px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 850px;
            width: 100%;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            
        }
        .form-group input, .form-group select, .form-group textarea , .form-group pwd{
            font-family: 'Poppins', sans-serif;
            width: 95%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            
        }
        .form-group textarea {
            width: 95%;
            
            resize: none;
            font-family: 'Poppins', sans-serif;
           
        }
        .form-group input[type="file"] {
            width: 90%;
            padding: 3px;
            font-family: 'Poppins', sans-serif;
        }
        .form-group input[type="select"] {
            width: 100%;
            padding: 3px;
            font-family: 'Poppins', sans-serif;
        }
        .form-actions {
            text-align: center;
            font-family: 'Poppins', sans-serif;
        }
        .form-actions button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
        }
        .submit-btn {
            background-color: #28a745;
            color: white;
        }
        .reset-btn {
            background-color: #dc3545;
            color: white;
        }
        .form-actions button:hover {
            opacity: 0.9;
        }
        

        .form-group.agreement {
    display: flex;
    align-items: center;
    margin-top: 15px;
}
.form-group input[type="password"] {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    
}

/* Password field zoom effect on hover */
.form-group input[type="password"]:hover {
    transform: scale(1.05); /* Zoom effect */
    border-color: #007bff; /* Change border color on hover */
}
.form-group.agreement input[type="checkbox"] {
    margin-right: 10px;
    width: auto;
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
    <br><br>

    <!-- Registration Form -->

    <div class="form-container">
        <h2>Student Registration Form</h2>
        <form action="addstudent" method="post" enctype="multipart/form-data">
        
        	<div class="form-group">
                <label for="roll-number">Roll Number / Student ID</label>
                <input type="text" id="roll-number" name="sid" required>
            </div>
            <!-- Personal Details -->
            <div class="form-group">
                <label for="full-name">Full Name</label>
                <input type="text" id="full-name" name="sname" required>
            </div>
            
            
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="sdob" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="sgender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <!-- New Password Field -->
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="spwd" required>
    </div>

   
            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="saddress" rows="3" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="semail" required>
            </div>
            <div class="form-group">
                <label for="phone">Contact Number</label>
                <input type="tel" id="phone" name="scontact" required>
            </div>
            
            <!-- Agreement -->
            <div class="form-group agreement">
                <input type="checkbox" id="agreement" name="agreement" required>
                <label for="agreement">I confirm that all the information provided is true to the best of my knowledge.</label>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <button type="submit" class="submit-btn">Submit</button> &nbsp;&nbsp;   
                <button type="reset" class="reset-btn">Reset</button>
            </div>
        </form>
    </div>

</body>
</html>

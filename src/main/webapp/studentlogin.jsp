<!DOCTYPE html>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <link rel="stylesheet" href="./css/studentlogin.css">

    <style>
    @charset "UTF-8";
/* From Uiverse.io by JohnnyCSilva */ 
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');

body{
  font-family: 'Poppins', sans-serif;
}
.alert.errormsg {
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background-color: #fee2e2; /* Light red background */
    border: 1px solid #f87171; /* Red border */
    color: #b91c1c; /* Dark red text */
    font-size: 1rem;
}

.alert.errormsg::before {
    content: '\2716'; /* Unicode for 'X' symbol */
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    background: #f87171; /* Red background for icon */
    border-radius: 50%;
    color: #b91c1c; /* Dark red icon */
    font-size: 1.2rem;
    font-weight: bold;
}

.form {
    display: flex;
    flex-direction: column;
    gap: 10px;
    background-color: #ffffff;
    padding: 30px;
    width: 550px;
    border-radius: 20px;
    font-family: 'Poppins', sans-serif;
    margin-top: 98px;
    margin-left: 100px;
  }
  
  ::placeholder {
    font-family: 'Poppins', sans-serif;
  }
  
  .form button {
    align-self: flex-end;
  }
  
  .flex-column > label {
    color: #151717;
    font-weight: 600;
  }
  
  .inputForm {
    border: 1.5px solid #ecedec;
    border-radius: 10px;
    height: 50px;
    display: flex;
    align-items: center;
    padding-left: 10px;
    transition: 0.2s ease-in-out;
  }
  
  .input {
    margin-left: 10px;
    border-radius: 10px;
    border: 10px;
    width: 100%;
    height: 100%;
    font-family: 'Poppins', sans-serif;
  }
  
  .input:focus {
    outline: none;
  }
  
  .inputForm:focus-within {
    border: 1.5px solid #2d79f3;
  }
  
  .flex-row {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 10px;
    justify-content: space-between;
  }
  
  .flex-row > div > label {
    font-size: 14px;
    color: black;
    font-weight: 400;
  }
  
  .span {
    font-size: 14px;
    margin-left: 5px;
    color: #2d79f3;
    font-weight: 500;
    cursor: pointer;
  }
  
  .button-submit {
    margin: 20px 0 10px 0;
    background-color: #151717;
    border: none;
    color: white;
    font-size: 15px;
    font-weight: 500;
    border-radius: 10px;
    height: 50px;
    width: 100%;
    cursor: pointer;
    font-family: 'Poppins', sans-serif;
  }
  
  .p {
    text-align: center;
    color: black;
    font-size: 14px;
    margin: 5px 0;
  }
  
  .btn {
    margin-top: 10px;
    width: 100%;
    height: 50px;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 500;
    gap: 10px;
    border: 1px solid #ededef;
    background-color: white;
    cursor: pointer;
    transition: 0.2s ease-in-out;
  }
  
  .btn:hover {
    border: 1px solid #2d79f3;
    ;
  }
  
  nav {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 62px;
    background-color: #2f335a;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  }
  nav .navbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 100%;
    max-width: 90%;
    background: #2f335a;
    margin: auto;
  }
  nav .navbar .logo a {
    color: #fff;
    font-size: 27px;
    font-weight: 600;
    text-decoration: none;
  }
  nav .navbar .menu {
    display: flex;
  }
  .navbar .menu li {
    list-style: none;
    margin: 0 15px;
  }
  .navbar .menu li a {
    color: #fff;
    font-size: 17px;
    font-weight: 500;
    text-decoration: none;
  }
  
  
      
        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 100vh;
        }

        .image {
            width: 60%;
            height: 600px;
            max-width: none;
            margin-top: 60px;
        }
        /* Modal styling */
/* Forgot Password Modal Enhancements */
.modal {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    background-color: #ffffff;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    padding: 30px;
    z-index: 1001;
    text-align: center;
    transition: all 0.3s ease;
}

.modal-header {
    font-size: 22px;
    font-weight: 600;
    color: #2f335a;
    margin-bottom: 20px;
    text-align: center;
}

.modal input {
    width: 100%;
    padding: 12px 15px;
    margin: 10px 0;
    border: 1.5px solid #ecedec;
    border-radius: 10px;
    font-family: 'Poppins', sans-serif;
    font-size: 15px;
    transition: border-color 0.2s ease-in-out;
}

.modal input:focus {
    outline: none;
    border-color: #2d79f3;
}

.modal button {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    background-color: #2f335a;
    color: white;
    border: none;
    border-radius: 10px;
    font-family: 'Poppins', sans-serif;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.modal button:hover {
    background-color: #2d79f3;
}

.modal button:last-child {
    background-color: #f1f1f1;
    color: #151717;
}

.modal button:last-child:hover {
    background-color: #e0e0e0;
}

.modal-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4);
    z-index: 1000;
    transition: opacity 0.3s ease;
}
        
    </style>
</head>
<body>
    <nav>
    <div class="navbar">
      <div class="logo"><a href="http://localhost:2005/">CareerStream</a></div>
      
    </div>
  </nav>
    
    <div class="container">
        <img class="image" src="../images/studentlogin.jpg" alt="Student Login Image" />
        <form class="form" method="post" action="checkstudentlogin">
        <c:if test="${not empty msg}">
            <div class="alert errormsg">
                <c:out value="${msg}" />
            </div>
        </c:if>
            <div class="flex-column">
                <label>University ID</label>
                <div class="inputForm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect>
                        <rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect>
                        <line x1="6" y1="6" x2="6" y2="6"></line>
                        <line x1="10" y1="6" x2="10" y2="6"></line>
                    </svg>
                    <input placeholder="Enter Student ID" class="input" type="text" name="sid" required>
                </div>
            </div>

            <div class="flex-column">
                <label>Password</label>
                <div class="inputForm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="-64 0 512 512">
                        <path d="m336 512h-288c-26.453125 0-48-21.523438-48-48v-224c0-26.476562 21.546875-48 48-48h288c26.453125 0 48 21.523438 48 48v224c0 26.476562-21.546875 48-48 48zm-288-288c-8.8125 0-16 7.167969-16 16v224c0 8.832031 7.1875 16 16 16h288c8.8125 0 16-7.167969 16-16v-224c0-8.832031-7.1875-16-16-16zm0 0"></path>
                        <path d="m304 224c-8.832031 0-16-7.167969-16-16v-80c0-52.929688-43.070312-96-96-96s-96 43.070312-96 96v80c0 8.832031-7.167969 16-16 16s-16-7.167969-16-16v-80c0-70.59375 57.40625-128 128-128s128 57.40625 128 128v80c0 8.832031-7.167969 16-16 16zm0 0"></path>
                    </svg>
                    <input placeholder="Enter your Password" class="input" type="password" name="spwd" required>
                </div>
            </div>

            <div class="flex-row">
                <div>
                    <input type="radio">
                    <label>Remember me</label>
                </div>
                <button type="button" class="forgot-password-btn" onclick="openForgotPasswordModal()">Forgot Password?</button>

            </div>

            <button type="submit" class="button-submit">Sign In</button>
            
            
        </form>
    </div>
    
     <!-- Modals -->
    <div id="forgotPasswordModal" class="modal">
        <div class="modal-header">Forgot Password</div>
        <input type="text" id="forgotUsername" placeholder="Enter Student ID">
        <button onclick="sendOtp()">Send OTP</button>
        <button onclick="closeModal('forgotPasswordModal')">Close</button>
    </div>
    <div id="verifyOtpModal" class="modal">
        <div class="modal-header">Verify OTP</div>
        <input type="text" id="otpInput" placeholder="Enter the OTP">
        <button onclick="verifyOtp()">Verify OTP</button>
        <button onclick="closeModal('verifyOtpModal')">Close</button>
    </div>
    <div id="modalOverlay" class="modal-overlay"></div>
    
    <script>
function sendOtp() {
    const username = document.getElementById('forgotUsername').value;
    if (!username) {
        alert('Please enter your username.');
        return;
    }

    fetch('/student/sendOtp?username=' + encodeURIComponent(username), {
        method: 'POST'
    })
    .then(response => {
        if (!response.ok) {
            if (response.status === 404) {
                throw new Error('User not found. Please check your username.');
            } else {
                throw new Error('An error occurred. Please try again.');
            }
        }
        return response.text();
    })
    .then(data => {
        alert('OTP sent successfully!');
        closeModal('forgotPasswordModal');
        document.getElementById('verifyOtpModal').style.display = 'block';
        document.getElementById('modalOverlay').style.display = 'block';
    })
    .catch(err => {
        alert(err.message);
    });
}

function verifyOtp() {
    const otp = document.getElementById('otpInput').value;
    const username = document.getElementById('forgotUsername').value; // Get the username from the modal input field

    if (!otp) {
        alert('Please enter the OTP.');
        return;
    }

    fetch('/student/verifyOtp?otp=' + encodeURIComponent(otp), {
        method: 'POST'
    })
    .then(response => response.text())
    .then(data => {
        if (data.includes('Verified')) {
            alert('OTP verified successfully!');
            closeModal('verifyOtpModal');
            window.location.href = '/student/forgotpwd?id=' + encodeURIComponent(username);
        } else {
            alert('Invalid OTP.');
        }
    })
    .catch(err => alert('Error verifying OTP.'));
}

function openForgotPasswordModal() {
    console.log('Opening Forgot Password Modal'); // Debug message
    document.getElementById('forgotPasswordModal').style.display = 'block';
    document.getElementById('modalOverlay').style.display = 'block';
}


function closeModal(modalId) {
    document.getElementById(modalId).style.display = 'none';
    document.getElementById('modalOverlay').style.display = 'none';
}
</script>


</body>
</html>
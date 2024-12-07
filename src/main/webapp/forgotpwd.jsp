<!DOCTYPE html>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Password Reset</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* Poppins Font Import */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .password-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 30px;
            width: 100%;
            max-width: 450px;
            margin-left: 440px;
        }

        .validation-item {
            transition: color 0.3s ease;
        }

        .validation-item.valid {
            color: green;
        }

        .validation-item.invalid {
            color: red;
        }

        #passwordValidations {
            font-size: 0.8rem;
            margin-top: 10px;
        }
        .alert {
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background-color: #dcfce7;
    border: 1px solid #86efac;
    color: #166534;
    font-size: 1rem;
}

.alert::before {
    content: '\2713'; /* Unicode for tick mark */
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    background: #86efac;
    border-radius: 50%;
    color: #166534;
    font-size: 1.2rem;
    font-weight: bold;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="password-container">
            <h2 class="text-center mb-4">Password Reset</h2>
            <c:if test="${not empty msg}">
            <div class="alert">
                <c:out value="${msg}" />
            </div>
        </c:if>
            <form id="passwordResetForm" action="changepwd" method="post">
                <div class="mb-3">
                    <label for="studentId" class="form-label">Student ID</label>
                    <input type="text" class="form-control" id="studentId" name="sid"  placeholder="Enter Student ID"  value="${id }" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">New Password</label>
                    <input type="password" class="form-control" id="password" name="npwd" placeholder="Enter New Password" required>
                    
                    <div id="passwordValidations" class="mt-2">
                        <div id="lengthValidation" class="validation-item invalid">
                            ✖ At least 8 characters long
                        </div>
                        <div id="uppercaseValidation" class="validation-item invalid">
                            ✖ Contains at least one uppercase letter
                        </div>
                        <div id="lowercaseValidation" class="validation-item invalid">
                            ✖ Contains at least one lowercase letter
                        </div>
                        <div id="numberValidation" class="validation-item invalid">
                            ✖ Contains at least one number
                        </div>
                        <div id="specialCharValidation" class="validation-item invalid">
                            ✖ Contains at least one special character (!@#$%^&*)
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="cpwd"  placeholder="Confirm New Password" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Reset Password</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <script>
        const password = document.getElementById('password');
        const studentId = document.getElementById('studentId');
        const confirmPassword = document.getElementById('confirmPassword');
        const form = document.getElementById('passwordResetForm');

        // Validation elements
        const lengthValidation = document.getElementById('lengthValidation');
        const uppercaseValidation = document.getElementById('uppercaseValidation');
        const lowercaseValidation = document.getElementById('lowercaseValidation');
        const numberValidation = document.getElementById('numberValidation');
        const specialCharValidation = document.getElementById('specialCharValidation');

        // Real-time password validation
        password.addEventListener('input', function() {
            const passwordValue = password.value;

            // Length validation
            if (passwordValue.length >= 8) {
                lengthValidation.classList.remove('invalid');
                lengthValidation.classList.add('valid');
                lengthValidation.innerHTML = '✔ At least 8 characters long';
            } else {
                lengthValidation.classList.remove('valid');
                lengthValidation.classList.add('invalid');
                lengthValidation.innerHTML = '✖ At least 8 characters long';
            }

            // Uppercase validation
            if (/[A-Z]/.test(passwordValue)) {
                uppercaseValidation.classList.remove('invalid');
                uppercaseValidation.classList.add('valid');
                uppercaseValidation.innerHTML = '✔ Contains at least one uppercase letter';
            } else {
                uppercaseValidation.classList.remove('valid');
                uppercaseValidation.classList.add('invalid');
                uppercaseValidation.innerHTML = '✖ Contains at least one uppercase letter';
            }

            // Lowercase validation
            if (/[a-z]/.test(passwordValue)) {
                lowercaseValidation.classList.remove('invalid');
                lowercaseValidation.classList.add('valid');
                lowercaseValidation.innerHTML = '✔ Contains at least one lowercase letter';
            } else {
                lowercaseValidation.classList.remove('valid');
                lowercaseValidation.classList.add('invalid');
                lowercaseValidation.innerHTML = '✖ Contains at least one lowercase letter';
            }

            // Number validation
            if (/[0-9]/.test(passwordValue)) {
                numberValidation.classList.remove('invalid');
                numberValidation.classList.add('valid');
                numberValidation.innerHTML = '✔ Contains at least one number';
            } else {
                numberValidation.classList.remove('valid');
                numberValidation.classList.add('invalid');
                numberValidation.innerHTML = '✖ Contains at least one number';
            }

            // Special character validation
            if (/[!@#$%^&*]/.test(passwordValue)) {
                specialCharValidation.classList.remove('invalid');
                specialCharValidation.classList.add('valid');
                specialCharValidation.innerHTML = '✔ Contains at least one special character (!@#$%^&*)';
            } else {
                specialCharValidation.classList.remove('valid');
                specialCharValidation.classList.add('invalid');
                specialCharValidation.innerHTML = '✖ Contains at least one special character (!@#$%^&*)';
            }
        });

        
    </script>
</body>
</html>
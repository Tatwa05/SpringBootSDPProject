<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Selection</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .role-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .role-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .role-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        h1, .card-title, .card-text {
            color: #00008B; /* Dark blue text color */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-5">Select Your Role</h1>
        <div class="row justify-content-center">
            <div class="col-md-4 mb-4">
                <a href="admin/adminlogin" class="text-decoration-none">
                    <div class="card role-card text-center p-4">
                        <div class="card-body">
                            <i class="fas fa-user-cog role-icon text-primary"></i>
                            <h5 class="card-title">Admin</h5>
                            <p class="card-text">Manage the system and users</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-4 mb-4">
                <a href="student/studentlogin" class="text-decoration-none">
                    <div class="card role-card text-center p-4">
                        <div class="card-body">
                            <i class="fas fa-user-graduate role-icon text-success"></i>
                            <h5 class="card-title">Student</h5>
                            <p class="card-text">Access courses and resources</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-4 mb-4">
                <a href="recruiter/rlogin" class="text-decoration-none">
                    <div class="card role-card text-center p-4">
                        <div class="card-body">
                            <i class="fas fa-user-tie role-icon text-info"></i>
                            <h5 class="card-title">Recruiter</h5>
                            <p class="card-text">Find and connect with talent</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (optional, for certain components) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>